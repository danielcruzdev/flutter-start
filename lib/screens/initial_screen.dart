import 'package:flutter/material.dart';
import 'package:flutter_start/data/task_inherited.dart';
import 'package:flutter_start/screens/form_screen.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (newContext) => FormScreen(taskContext: context)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
