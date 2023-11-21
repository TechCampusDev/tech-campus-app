import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/models/event.dart';
import 'package:tcapp/models/user_profile.dart';

part 'user_profile_list_provider.freezed.dart';

@freezed
class UserProfileListState with _$UserProfileListState {
  factory UserProfileListState({
    @Default([]) List<UserProfile> userProfiles,
    @Default(0) int moreCountCanShow,
  }) = _UserProfileListState;
}

final userProfileListProvider = StateNotifierProvider.autoDispose<
    UserProfileListController, UserProfileListState>((ref) {
  return UserProfileListController();
});

class UserProfileListController extends StateNotifier<UserProfileListState> {
  UserProfileListController() : super(UserProfileListState());

  Future<void> fetchUserProfiles({
    required bool isSignedIn,
    String? eventId,
  }) async {
    if (eventId == null) {
      return _fetchAllMembers(isSignedIn);
    }
    return _fetchMembersByEventId(isSignedIn, eventId);
  }

  Future<void> _fetchAllMembers(bool isSignedIn) async {
    final snapshots = await FirebaseFirestore.instance
        .collection('userProfiles')
        .doc('v1')
        .collection(isSignedIn ? 'protected' : 'public')
        .get();
    final userProfiles =
        snapshots.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    state = state.copyWith(userProfiles: userProfiles);
  }

  Future<void> _fetchMembersByEventId(bool isSignedIn, String eventId) async {
    final eventSnapshot = await FirebaseFirestore.instance
        .collection('events')
        .doc('v1')
        .collection('public')
        .doc(eventId)
        .get();
    final event = Event.fromJson(eventSnapshot.data()!);
    final speakerUserIds = event.speakerUserIds;

    final userProfiles = <UserProfile>[];
    var moreCountCanShow = 0;
    for (final speakerUserId in speakerUserIds) {
      final userProfileSnapshot = await FirebaseFirestore.instance
          .collection('userProfiles')
          .doc('v1')
          .collection(isSignedIn ? 'protected' : 'public')
          .doc(speakerUserId)
          .get();
      if (userProfileSnapshot.data() == null) {
        moreCountCanShow++;
        continue;
      }
      final userProfile = UserProfile.fromJson(userProfileSnapshot.data()!);
      userProfiles.add(userProfile);
    }
    state = state.copyWith(
      userProfiles: userProfiles,
      moreCountCanShow: moreCountCanShow,
    );
  }
}
