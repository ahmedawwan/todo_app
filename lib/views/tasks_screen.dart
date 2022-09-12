import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  List<Map<String, dynamic>>? listMapTasks = [
    {
      'title': 'Task number 1',
      'isDone': false,
    },
    {
      'title': 'Task number 2',
      'isDone': false,
    },
    {
      'title': 'Task number 3',
      'isDone': false,
    },
  ];

  TextEditingController addTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModal(context),
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  itemCount: listMapTasks?.length ?? 0,
                  itemBuilder: (context, index) =>
                      taskItem(context, listMapTasks![index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  showModal(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
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
                  onTap: () {
                    if (addTaskController.text.isNotEmpty)
                      addTask(addTaskController.text.trim(), context);
                  },
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
      },
    );
  }

  void addTask(String task, context) {
    listMapTasks?.add({'title': task, 'isDone': false});
    (context as Element).markNeedsBuild();
    Navigator.pop(context);
  }

  ListTile taskItem(context, Map<String, dynamic> item) {
    return ListTile(
      title: Text(
        item['title'],
        style: TextStyle(
            decoration: item['isDone']
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: item['isDone'],
        onChanged: (bool? val) {
          item['isDone'] = val ?? false;
          (context as Element).markNeedsBuild();
        },
      ),
    );
  }
}
