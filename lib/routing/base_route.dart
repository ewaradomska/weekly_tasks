import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weekly_tasks/routing/routes.dart';

abstract class BaseRoute {
  BaseRoute(this.route);

  @protected
  final CommonRoute route;

  /// Method responsible for any security checks etc.
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return null;
  }

  /// Method responsible for displaying page content and it should be used for defining the logic of the routes.
  /// For animations check pageBuilder method.
  Widget builder(BuildContext context, GoRouterState state);

  /// Method responsible for handling transition between pages. When using transition, build method should be passed as a child.
  Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: builder(context, state),
    );
  }

  /// create a GoRoute out of this CommonRouteBase
  GoRoute configure({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: route.path,
      name: route.name,
      routes: routes,
      parentNavigatorKey: parentNavigatorKey,
      redirect: redirect,
      pageBuilder: pageBuilder,
    );
  }
}
