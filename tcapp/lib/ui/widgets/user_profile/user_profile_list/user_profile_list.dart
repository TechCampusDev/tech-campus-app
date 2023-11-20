import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_card.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list_provider.dart';

class UserProfileList extends HookConsumerWidget {
  const UserProfileList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(userProfileListProvider.notifier).fetchUserProfiles();
        return null;
      },
      const [],
    );
    final userProfiles = ref.watch(
      userProfileListProvider.select((value) => value.userProfiles),
    );

    return Wrap(
      children: [
        for (final userProfile in userProfiles)
          UserProfileCard(userProfile: userProfile),
      ],
    );
  }
}
