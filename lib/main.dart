import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Thing {
  final String name;
  final String description;
  final String imagePath;

  Thing({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const WelcomeScreen({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo a Lista de Coisas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Mato!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: const Text('Ver Lista de Coisas'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<Thing> things = [
    Thing(name: 'Coisa 1', description: 'Descrição da coisa 1', imagePath: 'assets/imagem1'),
    Thing(name: 'Coisa 2', description: 'Descrição da coisa 2', imagePath: 'assets/imagem3.jpg'),
    Thing(name: 'Coisa 3', description: 'Descrição da coisa 3', imagePath: 'assets/sapoteclado.jpg'),
    // Adicione mais coisas conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(
          onButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThingListScreen(things: things),
              ),
            );
          },
        ),
      },
    );
  }
}

class ThingListScreen extends StatelessWidget {
  final List<Thing> things;

  const ThingListScreen({required this.things});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Coisas'),
      ),
      body: ListView.builder(
        itemCount: things.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(things[index].imagePath),
            title: Text(things[index].name),
            subtitle: Text(things[index].description),
          );
        },
      ),
    );
  }
}
