import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double levelTotal = 0.0;

  void level() {
    levelTotal = TaskInherted.of(context)
        .taskList
        .map((task) => task.nivel / task.dificuldade)
        .reduce((a, b) => a + b);
  }

  int barra() {
    return TaskInherted.of(context)
        .taskList
        .map((task) => task.dificuldade * 10)
        .reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                level();
              });
            },
            icon: const Icon(Icons.autorenew),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: levelTotal / barra(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Level: $levelTotal',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherted.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
