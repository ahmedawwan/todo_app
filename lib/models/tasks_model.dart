class TaskModel {
  String? title;
  bool? isDone;

  TaskModel({
    this.title,
    this.isDone = false,
  });

  toggleIsDone() {
    isDone = !isDone!;
  }
}
