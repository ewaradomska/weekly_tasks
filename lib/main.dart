import 'package:flutter/material.dart';
import 'package:weekly_tasks/bootstrap.dart';
import 'package:weekly_tasks/routing/router.dart';

void main() {
  bootstrap(() => const WeeklyTasks());
}

class WeeklyTasks extends StatelessWidget {
  const WeeklyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
