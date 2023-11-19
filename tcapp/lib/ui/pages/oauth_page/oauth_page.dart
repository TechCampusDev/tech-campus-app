import 'package:dio/dio.dart';
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
          final dio = Dio();

          await dio.post<Map<String, dynamic>>(
            'https://slack.com/api/openid.connect.token',
            data: {'code': code},
          );
        }

        f();
        return null;
      },
      [code],
    );
    return const Placeholder();
  }
}