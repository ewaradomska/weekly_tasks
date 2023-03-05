import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weekly_tasks/routing/base_route.dart';
import 'package:weekly_tasks/routing/routes.dart';

class TaskRoute extends BaseRoute {
  TaskRoute() : super(CommonRoute.task);

  @override
  Widget builder(BuildContext context, GoRouterState state) {
    return Container(); // TODO details!
  }
}
