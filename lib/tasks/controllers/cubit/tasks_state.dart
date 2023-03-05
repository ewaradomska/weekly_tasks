part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial(List<Task> tasks) = _Initial;
  const factory TasksState.tasks(List<Task> tasks) = _Tasks;
}

extension TasksStateX on TasksState {
  bool get isInitial => maybeWhen(
        orElse: () => false,
        initial: (tasks) => true,
      );
  bool get hasTasks => maybeWhen(orElse: () => false, tasks: (tasks) => true);
}
