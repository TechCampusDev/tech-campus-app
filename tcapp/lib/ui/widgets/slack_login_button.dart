import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcapp/env/env.dart';
import 'package:tcapp/gen/assets.gen.dart';
import 'package:tcapp/utils/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SlackLoginButton extends StatelessWidget {
  const SlackLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildBody(context),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.white,
      child: InkWell(
        onTap: () => onTap(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(color: Colors.white54),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  Assets.images.icSlackLogo.path,
                  width: 44,
                  height: 44,
                ),
                const Text('Sign in with '),
                const Text(
                  'Slack',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTap(BuildContext context) async {
    final currentPath = GoRouterState.of(context).uri.toString();
    final params = {
      'client_id': Env.slackClientId,
      'scope': ['openid', 'profile'].join(','),
      'redirect_uri': '$kAppUrl/oauth?from=$currentPath',
      'response_type': 'code',
    };

    final url =
        Uri.https('slack.com', '/openid/connect/authorize', params).toString();
    await launchUrlString(url);
  }
}
