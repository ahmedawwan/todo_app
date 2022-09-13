import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/providers/task_provider.dart';
import 'package:state_management_examples/views/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          scaffoldBackgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
