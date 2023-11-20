import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/models/user_profile.dart';
import 'package:tcapp/providers/auth_provider.dart';

part 'user_profile_list_provider.freezed.dart';

@freezed
class UserProfileListState with _$UserProfileListState {
  factory UserProfileListState({
    @Default([]) List<UserProfile> userProfiles,
  }) = _UserProfileListState;
}

final userProfileListProvider = StateNotifierProvider.autoDispose<
    UserProfileListController, UserProfileListState>((ref) {
  final isSignedIn =
      ref.watch(authProvider.select((value) => value.isSignedIn));
  return UserProfileListController(isSignedIn: isSignedIn);
});

class UserProfileListController extends StateNotifier<UserProfileListState> {
  UserProfileListController({
    required bool isSignedIn,
  })  : _isSignedIn = isSignedIn,
        super(UserProfileListState());

  final bool _isSignedIn;

  Future<void> fetchUserProfiles({String? eventId}) async {
    if (eventId == null) {
      return _fetchAllMembers();
    }
    return _fetchMembersByEventId(eventId);
  }

  Future<void> _fetchAllMembers() async {
    final snapshots = await FirebaseFirestore.instance
        .collection('userProfiles')
        .doc('v1')
        .collection(_isSignedIn ? 'protected' : 'public')
        .get();
    final userProfiles =
        snapshots.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    state = state.copyWith(userProfiles: userProfiles);
  }

  Future<void> _fetchMembersByEventId(String eventId) async {
    final snapshots = await FirebaseFirestore.instance
        .collection('userProfiles')
        .doc('v1')
        .collection(_isSignedIn ? 'protected' : 'public')
        .where('eventIds', arrayContains: eventId)
        .get();
    final userProfiles =
        snapshots.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    state = state.copyWith(userProfiles: userProfiles);
  }
}
