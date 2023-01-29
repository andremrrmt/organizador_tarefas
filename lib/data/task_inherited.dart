import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';


class TaskInherted extends InheritedWidget {
  TaskInherted({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 4),
    Task('Pedalar', 'assets/images/bike.jpg', 2),
    Task('Correr', 'assets/images/corrida.jpg', 3),
    Task('Jogar', 'assets/images/game.jpg', 1),
    Task('Ler', 'assets/images/ler.jpg', 4),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherted of(BuildContext context) {
    final TaskInherted? result = context.dependOnInheritedWidgetOfExactType<TaskInherted>();
    assert(result != null, 'No TaskInherted found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherted oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
