import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';
import 'package:tcapp/ui/widgets/slack_login_button.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_card.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list_provider.dart';

class UserProfileList extends HookConsumerWidget {
  const UserProfileList({
    this.eventId,
    super.key,
  });

  final String? eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn =
        ref.watch(authProvider.select((value) => value.isSignedIn));
    useEffect(
      () {
        ref.read(userProfileListProvider.notifier).fetchUserProfiles(
              isSignedIn: isSignedIn,
              eventId: eventId,
            );
        return null;
      },
      [isSignedIn, eventId],
    );
    final userProfiles = ref.watch(
      userProfileListProvider.select((value) => value.userProfiles),
    );

    return Wrap(
      children: [
        for (final userProfile in userProfiles)
          UserProfileCard(userProfile: userProfile),
        buildMoreUser(),
      ],
    );
  }

  Widget buildMoreUser() {
    return Consumer(
      builder: (context, ref, _) {
        final moreCountCanShow = ref.watch(
          userProfileListProvider.select((value) => value.moreCountCanShow),
        );
        final isSignedIn =
            ref.watch(authProvider.select((value) => value.isSignedIn));
        var text = '';
        if (eventId == null) {
          text = 'SlackでサインインするとTechCampus内限定公開のメンバーのプロフィールを表示できます';
        } else if (moreCountCanShow != 0) {
          text = 'Slackでサインインすると他$moreCountCanShow人を表示できます';
        }

        if (text.isEmpty || isSignedIn) return const SizedBox.shrink();

        return Card(
          child: Container(
            width: 360,
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            color: Colors.blueGrey[100],
            child: Center(
              child: Column(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SlackLoginButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
