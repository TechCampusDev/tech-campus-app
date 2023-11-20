import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class OauthPage extends HookWidget {
  const OauthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final qParams = GoRouterState.of(context).uri.queryParametersAll;
    final code = qParams['code']?.first;
    useEffect(
      () {
        if (code == null) {
          return;
        }
        Future<void> f() async {
          final functions =
              FirebaseFunctions.instanceFor(region: 'asia-northeast1');
          final result = await functions
              .httpsCallable(
            'onCallSlackOauth',
          )
              .call<Map<String, String>>({'code': code});
          final customToken = result.data['customToken']!;

          await FirebaseAuth.instance.signInWithCustomToken(customToken);

          // もとの画面に戻る
        }

        f();
        return null;
      },
      [code],
    );
    return const Placeholder();
  }
}
