import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/router/routes.dart';
import 'package:tcapp/ui/pages/event_page/event_page.dart';
import 'package:tcapp/ui/pages/index_page/index_page.dart';
import 'package:tcapp/ui/pages/oauth_page/oauth_page.dart';

final routerPublicProvider = Provider(
  (ref) {
    return [
      GoRoute(
        path: Routes.index,
        builder: (BuildContext context, GoRouterState state) =>
            const IndexPage(),
      ),
      GoRoute(
        path: Routes.oauth,
        builder: (BuildContext context, GoRouterState state) =>
            const OauthPage(),
      ),
      GoRoute(
        path: Routes.event(),
        builder: (BuildContext context, GoRouterState state) {
          final id = state.pathParameters['id']!;
          return EventPage(id: id);
        },
      ),
    ];
  },
);
