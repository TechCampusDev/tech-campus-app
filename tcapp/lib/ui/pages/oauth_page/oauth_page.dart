import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';

class OauthPage extends HookConsumerWidget {
  const OauthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qParams = GoRouterState.of(context).uri.queryParametersAll;
    final code = qParams['code']?.first;
    final from = qParams['from']?.first;
    useEffect(
      () {
        if (code == null) {
          return;
        }

        Future<void> f() async {
          await ref.read(authProvider.notifier).signin(code, from);

          // もとの画面に戻る
          if (!context.mounted) return;
          context.go(from!);
        }

        f();
        return null;
      },
      [code],
    );
    return const Center(child: Text('認証中...'));
  }
}
