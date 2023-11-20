import 'package:flutter/material.dart';
import 'package:tcapp/ui/layouts/app_layout/widgets/monitor_widget.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          const MonitorWidget(),
        ],
      ),
    );
  }
}
