import 'package:flutter/material.dart';
import 'package:state_management_examples/widgets/bottom_sheet.dart';
import 'package:state_management_examples/widgets/tasks_list.dart';

import '../models/tasks_model.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController addTaskController = TextEditingController();

  List<TaskModel> tasks = [
    TaskModel(title: 'This is task one'),
    TaskModel(title: 'This is task two'),
    TaskModel(title: 'This is task three'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return BottomSheetContent(
                addTaskController: addTaskController,
                addTask: () {
                  if (addTaskController.text.isNotEmpty) {
                    tasks.add(TaskModel(title: addTaskController.text.trim()));
                    setState(() {});
                  }
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =================================================================
            // Heading Area
            // =================================================================
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 30, bottom: 60, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =================================================================
                    // Icon Button
                    // =================================================================
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.list,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // =================================================================
                    // Heading
                    // =================================================================
                    Text(
                      'Todoey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    // =================================================================
                    // Sub Heading
                    // =================================================================
                    Text(
                      '12 Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // =================================================================
            // Tasks Area
            // =================================================================
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      spreadRadius: 10,
                      blurRadius: 30,
                      offset: Offset(0, -10),
                    ),
                  ],
                ),
                child: TasksList(tasks: tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showModal(context) {}
}
