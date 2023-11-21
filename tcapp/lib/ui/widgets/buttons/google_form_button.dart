import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GoogleFormButton extends StatelessWidget {
  const GoogleFormButton({
    required this.title,
    required this.url,
    super.key,
  });

  final String title;
  final String url;

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
