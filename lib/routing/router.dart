import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weekly_tasks/routing/routes/routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/tasks',
  navigatorKey: rootNavigatorKey,
  routes: [
    TasksRoute().configure(),
  ],
);
