import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, required this.addTaskController, required this.addTask});

  final TextEditingController addTaskController;
  final Function addTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // =============================================================
            // Heading
            // =============================================================
            Text(
              'Add Task',
              style: TextStyle(
                fontSize: 40,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
            // =============================================================
            // Text Field
            // =============================================================
            TextField(
              controller: addTaskController,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.lightBlueAccent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.lightBlueAccent),
                ),
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.lightBlueAccent),
                ),
              ),
            ),
            // =============================================================
            // Button
            // =============================================================
            GestureDetector(
              onTap: () =>addTask(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                height: 60,
                width: double.infinity,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
