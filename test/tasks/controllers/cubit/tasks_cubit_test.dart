import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_tasks/tasks/controllers/cubit/tasks_cubit.dart';

import '../../../mocks/mock_storage.dart';
import 'tasks_cubit_test_data.dart';

void main() {
  setUp(initHydratedStorage);

  group('json convertion', () {
    test('initial state toJson gives proper data', () {
      expect(TasksCubit().toJson(const TasksState.initial([])), intialJson);
    });

    test('initial state build properly from json', () {
      expect(TasksCubit().fromJson(intialJson), const TasksState.initial([]));
    });

    test('tasks state toJson gives proper data', () {
      expect(TasksCubit().toJson(TasksState.tasks(tasks)), tasksJson);
    });

    test('tasks state build properly from json', () {
      expect(TasksCubit().fromJson(tasksJson), TasksState.tasks(tasks));
    });
  });
}
