import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  TaskItem(
      {super.key,
      this.isChecked = false,
      required this.taskTitle,
      required this.checkboxCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (bool? val) => checkboxCallback(),
      ),
    );
  }
}
