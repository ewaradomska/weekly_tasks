import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weekly_tasks/routing/base_route.dart';
import 'package:weekly_tasks/routing/router.dart';
import 'package:weekly_tasks/routing/routes.dart';
import 'package:weekly_tasks/tasks/screens/tasks_list.dart';

class TasksRoute extends BaseRoute {
  TasksRoute() : super(CommonRoute.tasks);

  @override
  Widget builder(BuildContext context, GoRouterState state) {
    return const TasksList();
  }

  static void go() {
    rootNavigatorKey.currentContext?.goNamed(CommonRoute.tasks.name);
  }
}
