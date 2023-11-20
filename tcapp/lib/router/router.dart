import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tcapp/router/router_public.dart';
import 'package:tcapp/ui/layouts/app_layout/app_layout.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      ShellRoute(
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          final appLayout = AppLayout(child: child);
          return MaterialPage(child: appLayout);
        },
        // 認証不要のルート
        routes: [
          ...ref.watch(routerPublicProvider),
        ],
      ),
    ],
  ),
);
