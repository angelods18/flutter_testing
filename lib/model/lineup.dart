import 'package:flutter/material.dart';

const List<String> moduleList = ['3-4-3', '4-3-3', '4-4-2', '4-5-1', '3-5-2'];

class Titolare {
  String _ruolo = "";
  String? _nome = "";
  int _index = 0;

  String get ruolo => _ruolo;
  String? get nome => _nome;
  int get index => _index;

  Titolare(String ruolo, String? nome, int index) {
    _index = index;
    _nome = nome;
    _ruolo = ruolo;
  }
}

class LineUpModel extends ChangeNotifier {
  late String _modulo = moduleList.first;
  final List<Titolare> _titolari = [];
  final List<String> _panchinari = [];

  String get modulo => _modulo;
  List<Titolare> get titolari => _titolari;
  List<String> get panchinari => _panchinari;
  List<String> get moduliList => moduleList;

  int get sizeDef {
    List<int> moduloInt = modulo.split("-").map((e) => int.parse(e)).toList();
    return moduloInt[0];
  }

  int get sizeCen {
    List<int> moduloInt = modulo.split("-").map((e) => int.parse(e)).toList();
    return moduloInt[1];
  }

  int get sizeAtt {
    List<int> moduloInt = modulo.split("-").map((e) => int.parse(e)).toList();
    return moduloInt[2];
  }

  Titolare? get portiere {
    return titolari.isNotEmpty ? titolari[0] : Titolare("POR", null, 0);
  }

  List<Titolare?> get difensori {
    List<Titolare?> difList = [];
    // if (titolari.isEmpty || titolari.length < 2) {
    //   return difList;
    // }
    for (int i = 2; i < 2 + sizeDef; i++) {
      difList
          .add(titolari.length >= i ? titolari[i] : Titolare("DEF", null, i));
    }
    return difList;
  }

  List<Titolare?> get centrocampisti {
    List<Titolare?> cenList = [];
    // if (titolari.isEmpty || titolari.length < 2 + sizeDef) {
    //   return cenList;
    // }
    for (int i = 2 + sizeDef; i < 2 + sizeDef + sizeCen; i++) {
      cenList
          .add(titolari.length >= i ? titolari[i] : Titolare("CEN", null, i));
    }
    return cenList;
  }

  List<Titolare?> get attaccanti {
    List<Titolare?> attList = [];
    // if (titolari.isEmpty || titolari.length < 2 + sizeDef + sizeCen) {
    //   return attList;
    // }
    for (int i = 2 + sizeDef + sizeCen;
        i < 2 + sizeDef + sizeCen + sizeAtt;
        i++) {
      attList
          .add(titolari.length >= i ? titolari[i] : Titolare("ATT", null, i));
    }
    return attList;
  }

  set modulo(String mod) {
    _modulo = mod;

    notifyListeners();
  }

  void setModulo(String mod) {
    print("chiamato set modulo con $mod");
    _modulo = mod;
    notifyListeners();
  }

  void setTitolareToIndex(String ruolo, String nome, int index) {
    int indiceTit = 0;
    _titolari.insert(indiceTit, Titolare(ruolo, nome, index));

    notifyListeners();
  }

  void removeTitolare(String giocatore) {
    _titolari.remove(giocatore);

    notifyListeners();
  }

  void addPanchinaro(String giocatore) {
    _panchinari.add(giocatore);

    notifyListeners();
  }

  void removePanchinaro(String giocatore) {
    _panchinari.remove(giocatore);

    notifyListeners();
  }
}
