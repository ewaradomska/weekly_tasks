// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'package:weekly_tasks/tasks/models/task.dart';

part 'tasks_cubit.freezed.dart';
part 'tasks_state.dart';

@Injectable()
class TasksCubit extends HydratedCubit<TasksState> {
  TasksCubit() : super(const TasksState.initial([]));

  void createTask(String title) {
    emit(TasksState.initial(state.tasks));
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      done: false,
      expiryTime: DateTime.now().add(
        const Duration(days: 7),
      ),
    );
    final List<Task> newList = List.from(state.tasks);
    newList.add(task);
    emit(TasksState.tasks(newList));
  }

  void addTask(Task task) {
    emit(TasksState.initial(state.tasks));
    final List<Task> newList = List.from(state.tasks);
    newList.add(task);
    emit(TasksState.tasks(newList));
  }

  void deleteTask(String taskId) {
    final task =
        state.tasks.firstWhereOrNull((element) => element.id == taskId);
    if (task != null) {
      emit(TasksState.initial(state.tasks));
      final List<Task> updatedList = List.from(state.tasks);
      updatedList.remove(task);
      emit(TasksState.tasks(updatedList));
    }
  }

  void updateTask(Task task) {
    final newTask =
        state.tasks.firstWhereOrNull((element) => element.id == task.id);
    if (newTask != null) {
      emit(TasksState.initial(state.tasks));
      final List<Task> updatedList = List.from(state.tasks);
      final index = updatedList.indexOf(newTask);
      updatedList[index] = newTask;
      emit(TasksState.tasks(updatedList));
    }
  }

  void setAsDone(String taskId) {
    Task? newTask =
        state.tasks.firstWhereOrNull((element) => element.id == taskId);

    if (newTask != null) {
      emit(TasksState.initial(state.tasks));
      final List<Task> updatedList = List.from(state.tasks);
      final index = updatedList.indexOf(newTask);
      newTask = newTask.copyWith(done: true, updatedAt: DateTime.now());
      updatedList[index] = newTask;
      emit(TasksState.tasks(updatedList));
    }
  }

  Task? getById(String taskId) {
    return state.tasks.firstWhereOrNull((element) => element.id == taskId);
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    if (json['state'] == 'Tasks') {
      final List<Task> tasks = [];
      for (final element in json['tasks']) {
        tasks.add(Task.fromJson(element));
      }
      return TasksState.tasks(tasks);
    } else {
      return const TasksState.initial([]);
    }
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    if (state is _Tasks) {
      final List<Map<String, dynamic>> tasks = [];
      for (final task in state.tasks) {
        tasks.add(task.toJson());
      }
      return {
        'state': 'Tasks',
        'tasks': tasks,
      };
    } else {
      return {'state': 'Initial'};
    }
  }
}
