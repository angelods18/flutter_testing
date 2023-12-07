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

class Giocatore {
  String _ruolo = "";
  String _nome = "";

  String get ruolo => _ruolo;
  String get nome => _nome;

  Giocatore(String ruolo, String nome) {
    _ruolo = ruolo;
    _nome = nome;
  }
}

class LineUpModel extends ChangeNotifier {
  late String _modulo = moduleList.first;
  List<Titolare> _titolari = [];
  List<String> _panchinari = [];

  String get modulo => _modulo;
  List<Titolare> get titolari =>
      _titolari.length == 11 ? _titolari : buildTitolari();
  int get titolariSize => _titolari.length;

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
    for (int i = 1; i < 1 + sizeDef; i++) {
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
    for (int i = 1 + sizeDef; i < 1 + sizeDef + sizeCen; i++) {
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
    for (int i = 1 + sizeDef + sizeCen;
        i < 1 + sizeDef + sizeCen + sizeAtt;
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

  void initTitolari() {
    _titolari = buildTitolari();
  }

  void setModulo(String mod) {
    print("chiamato set modulo con $mod");
    _modulo = mod;
    _titolari = buildTitolari();
    notifyListeners();
  }

  void setTitolareToIndex(String ruolo, String nome, int index) {
    print("$nome è il $ruolo al posto $index");
    int indiceTit = index;
    switch (ruolo) {
      case "POR":
        indiceTit = 0;
        break;
      case "DEF":
        indiceTit = 1 + index;
      case "CEN":
        indiceTit = 1 + sizeDef + index;
      case "ATT":
        indiceTit = 1 + sizeDef + sizeCen + index;
      default:
        indiceTit = 0;
        break;
    }

    _titolari[indiceTit] = Titolare(ruolo, nome, index);

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

  List<Titolare> buildTitolari() {
    List<Titolare> titolari = [];
    titolari.add(Titolare("POR", null, 0));
    for (int i = 0; i < sizeDef; i++) {
      titolari.add(Titolare("DEF", null, i));
    }
    for (int i = 0; i < sizeCen; i++) {
      titolari.add(Titolare("CEN", null, i));
    }
    for (int i = 0; i < sizeAtt; i++) {
      titolari.add(Titolare("ATT", null, i));
    }
    return titolari;
  }
}
