import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/tasks_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(title: 'Buy milk'),
    TaskModel(title: 'Buy eggs'),
    TaskModel(title: 'Buy bread'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<TaskModel> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = TaskModel(title: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
