import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/router/routes.dart';
import 'package:tcapp/ui/pages/index_page/index_page.dart';

final routerPublicProvider = Provider(
  (ref) {
    return [
      GoRoute(
        path: Routes.index,
        builder: (BuildContext context, GoRouterState state) =>
            const IndexPage(),
      ),
    ];
  },
);
