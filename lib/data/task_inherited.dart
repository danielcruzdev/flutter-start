import 'package:flutter/material.dart';
import 'package:flutter_start/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    const Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    const Task('Andar de Bike', 'assets/images/bike.jpg', 2),
    const Task('Ler', 'assets/images/ler.jpg', 4),
    const Task('Meditar', 'assets/images/meditar.jpeg', 5),
    const Task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
