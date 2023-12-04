import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(NavApp());
// }

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NavAppState(),
        child: MaterialApp(
            title: 'My NavApp',
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            home: NavHomePage()));
  }
}

class NavAppState extends ChangeNotifier {}

class NavHomePage extends StatefulWidget {
  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  @override
  Widget build(BuildContext context) {
    final todos =
        List.generate(5, (i) => Todo('item $i', 'Descrizione item $i'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailScreen(),
                        settings: RouteSettings(arguments: todos[index]))

                    // DetailScreen(todo: todos[index])));
                    );
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // const DetailScreen({super.key, required this.todo}); // con MaterialPageRoute
  const DetailScreen({super.key});

  // final Todo todo; // con MaterialPageRoute

  @override
  Widget build(BuildContext context) {
    final todo =
        ModalRoute.of(context)!.settings.arguments as Todo; // con Modalroute

    return Scaffold(
        appBar: AppBar(title: Text(todo.title)),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Text(todo.description),
        ));
  }
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}
