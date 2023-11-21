import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/models/user_profile/user_profile.dart';
import 'package:tcapp/services/fire_event_service.dart';
import 'package:tcapp/services/fire_user_profile_service.dart';

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
    final userProfiles =
        await FireUserProfileService().fetchAllMembers(isSignedIn: isSignedIn);
    state = state.copyWith(userProfiles: userProfiles);
  }

  Future<void> _fetchMembersByEventId(bool isSignedIn, String eventId) async {
    final event = await FireEventService().fetchEvent(eventId: eventId);
    final speakerUserIds = event.speakerUserIds;

    final userProfiles = <UserProfile>[];
    var moreCountCanShow = 0;
    for (final speakerUserId in speakerUserIds) {
      try {
        final userProfile = await FireUserProfileService().fetchUserProfile(
          isSignedIn: isSignedIn,
          userId: speakerUserId,
        );
        userProfiles.add(userProfile);
      } catch (_) {
        moreCountCanShow++;
      }
    }
    state = state.copyWith(
      userProfiles: userProfiles,
      moreCountCanShow: moreCountCanShow,
    );
  }
}
