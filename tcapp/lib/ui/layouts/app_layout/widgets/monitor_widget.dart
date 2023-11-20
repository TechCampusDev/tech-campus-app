import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tcapp/providers/auth_provider.dart';

class MonitorWidget extends HookConsumerWidget {
  const MonitorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider);

    return const SizedBox();
  }
}
