import 'package:flutter/material.dart';
import 'package:state_management_examples/widgets/task_item.dart';

import '../models/tasks_model.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key, required this.tasks});
 final List<TaskModel> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) => TaskItem(
        taskTitle: widget.tasks[index].title!,
        isChecked: widget.tasks[index].isDone!,
        checkboxCallback: () {
          setState(() {
            widget.tasks[index].toggleIsDone();
          });
        },
      ),
    );
  }
}
