import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/providers/task_provider.dart';
import 'package:state_management_examples/widgets/task_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskData, child) {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return TaskItem(
              taskTitle: task.title!,
              isChecked: task.isDone!,
              checkboxCallback: () {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          });
    });
  }
}
