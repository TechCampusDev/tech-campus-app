import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GoogleFormButton extends ConsumerWidget {
  const GoogleFormButton({
    required this.title,
    required this.url,
    super.key,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn =
        ref.watch(authProvider.select((value) => value.isSignedIn));
    if (isSignedIn) return const SizedBox.shrink();
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
        onTap: onTap,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            color: Color(0xFF673AB7),
          ),
          child: Container(
            alignment: Alignment.center,
            height: 44,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 2),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTap() async {
    await launchUrlString(url);
  }
}
