import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';
import 'package:tcapp/ui/widgets/slack_login_button.dart';
import 'package:tcapp/ui/widgets/user_profile/user_profile_list/user_profile_list.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechCampusメンバー'),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final isSignedIn =
                  ref.watch(authProvider.select((value) => value.isSignedIn));
              if (!isSignedIn) return const SizedBox.shrink();
              return PopupMenuButton<String>(
                icon: const Icon(Icons.person),
                onSelected: (String value) {
                  if (value == 'logout') {
                    ref.read(authProvider.notifier).signout();
                  }
                },
                tooltip: '',
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      value: 'logout',
                      child: Text('ログアウト'),
                    ),
                  ];
                },
              );
            },
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: const [
        UserProfileList(),
        SizedBox(height: 20),
        Center(child: SlackLoginButton()),
      ],
    );
  }
}
