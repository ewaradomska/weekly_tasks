import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_tasks/get_it_conf.dart';
import 'package:weekly_tasks/routing/routes/routes.dart';
import 'package:weekly_tasks/tasks/controllers/cubit/tasks_cubit.dart';
import 'package:weekly_tasks/tasks/models/task.dart';
import 'package:weekly_tasks/tasks/widgets/add_task_sheet.dart';
import 'package:weekly_tasks/tasks/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TasksCubit>(),
      child: const _TasksListView(),
    );
  }
}

class _TasksListView extends StatelessWidget {
  const _TasksListView();

  @override
  Widget build(BuildContext context) {
    // TODO let's change this element UI to be really beautiful :)
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cubit = BlocProvider.of<TasksCubit>(context);
          final title = await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: const AddTask(),
              );
            },
          );
          if (title != null) {
            cubit.createTask(title);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          final List<Task> list = state.tasks
              .where((element) => element.expiryTime.isAfter(DateTime.now()))
              .toList();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: TaskTile(task: list[index]),
              );
            },
          );
        },
      ),
    );
  }
}
