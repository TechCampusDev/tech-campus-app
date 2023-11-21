import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';
import 'package:tcapp/ui/widgets/buttons/slack_login_button.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[400],
      centerTitle: true,
      title: Text(title ?? '', style: const TextStyle(color: Colors.white)),
      actions: [
        Consumer(
          builder: (context, ref, _) {
            final isSignedIn =
                ref.watch(authProvider.select((value) => value.isSignedIn));
            if (!isSignedIn) return const SlackLoginButton();
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
        const SizedBox(width: 16),
      ],
    );
  }
}
