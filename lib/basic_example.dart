import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }

    notifyListeners();
  }

  void removeFromFavorite(item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      notifyListeners();
    }
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: Container(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: page,
              )),
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'favorite')
                ],
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              )
            ],
          ),
        );
      }

      // schermi larghi almeno 450 px
      return Scaffold(
          body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
            extended: constraints.maxWidth >= 600,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('home')),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite), label: Text('favorite')),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          )),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ))
        ],
      ));
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var mainWord = appState.current;

    IconData icon;
    if (appState.favorites.contains(mainWord)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(mainWord: mainWord),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('like')),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('next'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text('Non hai inserito nulla tra i preferiti'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Hai ${favorites.length} elementi tra i preferiti'),
        ),
        for (var item in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(item.asLowerCase),
            trailing: ElevatedButton.icon(
              onPressed: () {
                // elimina dai preferiti
                appState.removeFromFavorite(item);
              },
              icon: Icon(Icons.delete),
              label: Text(''),
            ),
          )
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.mainWord,
  });

  final WordPair mainWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onSecondary);

    return Card(
      color: theme.colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(mainWord.asLowerCase, style: style),
      ),
    );
  }
}
