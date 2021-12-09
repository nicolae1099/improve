import 'dart:ui';

class Data {
  List<Task> tasks = [];

  void addTask(String name, Color color) {
    tasks.add(Task(name, color));
  }

  List<Task> getTasks() {
    return tasks;
  }
}

class Task {
  Task(this.name, this.color);
  String name;
  Color color;
}
