import 'package:weekly_tasks/tasks/controllers/cubit/tasks_cubit.dart';
import 'package:weekly_tasks/tasks/models/task.dart';

const taskStateInitial = TasksState.initial([]);

final task1 = Task(
  id: '1',
  title: 'task1',
  createdAt: DateTime(2023),
  updatedAt: DateTime(2023, 1, 2),
  done: true,
  expiryTime: DateTime(2023, 1, 4),
);
final task2 = Task(
  id: '2',
  title: 'task2',
  createdAt: DateTime(2023),
  updatedAt: DateTime(2023),
  done: false,
  expiryTime: DateTime(2023, 1, 4),
);

final tasks = [task1, task2];

final taskStateWithTasks = TasksState.tasks(tasks);

final intialJson = {'state': 'Initial'};

final tasksJson = {
  'state': 'Tasks',
  'tasks': [
    {
      'id': '1',
      'title': 'task1',
      'createdAt': '2023-01-01T00:00:00.000',
      'updatedAt': '2023-01-02T00:00:00.000',
      'done': true,
      'expiryTime': '2023-01-04T00:00:00.000'
    },
    {
      'id': '2',
      'title': 'task2',
      'createdAt': '2023-01-01T00:00:00.000',
      'updatedAt': '2023-01-01T00:00:00.000',
      'done': false,
      'expiryTime': '2023-01-04T00:00:00.000'
    }
  ]
};
