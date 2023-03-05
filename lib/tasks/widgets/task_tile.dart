import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_tasks/tasks/controllers/cubit/tasks_cubit.dart';
import 'package:weekly_tasks/tasks/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.amber,
      child: ListTile(
        onLongPress: () {
          // TODO show asking bottom sheet
          // TODO when deleting - nice animation - slide left
          BlocProvider.of<TasksCubit>(context).deleteTask(task.id);
        },
        onTap: () {
          // TODO nice animation when set as done :)
          BlocProvider.of<TasksCubit>(context).setAsDone(task.id);
        },
        // TODO let's do it prettier :)
        leading: task.done
            ? const Icon(
                Icons.done,
                color: Colors.green,
              )
            : const Icon(Icons.circle_outlined, color: Colors.grey),
        title: Text(task.title),
        trailing: const Icon(Icons.edit),
      ),
    );
  }
}
