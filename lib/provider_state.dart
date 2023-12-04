import 'dart:collection';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderStateApp extends StatelessWidget {
  const ProviderStateApp({super.key});

  @override
  Widget build(BuildContext) {
    return ChangeNotifierProvider(
        // segnalo al sistema qual è lo stato di cui mettersi in ascolto (per tutti i widget figli)
        create: (context) => ItemModel(),
        child: const ProviderApp());
  }
}

class ItemModel extends ChangeNotifier {
  // Classe che definisce lo stato, ovvero i dati i cui cambiamenti
  // devono essere richiamati e ascoltati da vari punti dell'app
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.costo);

  void add(Item item) {
    _items.add(item);
    // segnalo che è avvenuto un cambiamento a tutti i widget in ascolto
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Item {
  final String nome;
  final int costo;

  const Item(this.nome, this.costo);
}
