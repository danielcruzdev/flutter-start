import 'package:flutter/material.dart';
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
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/flutter.png',
                3),
            Task(
                'Andar de Bike',
                'assets/images/bike.jpg',
                2),
            Task(
                'Ler',
                'assets/images/ler.jpg',
                4),
            Task(
                'Meditar',
                'assets/images/meditar.jpeg',
                5),
            Task(
                'Jogar',
                'assets/images/jogar.jpg',
                1),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
