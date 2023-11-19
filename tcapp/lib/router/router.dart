import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tcapp/router/router_public.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      ShellRoute(
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return MaterialPage(child: child);
        },
        // 認証不要のルート
        routes: [
          ...ref.watch(routerPublicProvider),
        ],
      ),
    ],
  ),
);
