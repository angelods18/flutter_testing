import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/lineup.dart';
import 'package:flutter_first_app/ui/lines-up/rosa_dialog.dart';
import 'package:flutter_first_app/ui/lines-up/select_module.dart';
import 'package:provider/provider.dart';

List<Giocatore> rosa = [
  Giocatore("POR", 'POR1'),
  Giocatore("POR", 'POR2'),
  Giocatore("POR", 'POR3'),
  Giocatore("DEF", 'DEF1'),
  Giocatore("DEF", 'DEF2'),
  Giocatore("DEF", 'DEF3'),
  Giocatore("DEF", 'DEF4'),
  Giocatore("DEF", 'DEF5'),
  Giocatore("DEF", 'DEF6'),
  Giocatore("CEN", 'CEN1'),
  Giocatore("CEN", 'CEN2'),
  Giocatore("CEN", 'CEN3'),
  Giocatore("CEN", 'CEN4'),
  Giocatore("CEN", 'CEN5'),
  Giocatore("CEN", 'CEN6'),
  Giocatore("CEN", 'CEN7'),
  Giocatore("CEN", 'CEN8'),
  Giocatore("ATT", 'ATT1'),
  Giocatore("ATT", 'ATT2'),
  Giocatore("ATT", 'ATT3'),
  Giocatore("ATT", 'ATT4'),
  Giocatore("ATT", 'ATT5'),
  Giocatore("ATT", 'ATT6'),
];

class EditLineUpPage extends StatelessWidget {
  const EditLineUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/asset/images/field.jpg'),
                fit: BoxFit.fill,
                opacity: 0.9)),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LineUpModel()),
            // ChangeNotifierProvider(create: (context) => RosaModel())
          ],
          child: Consumer<LineUpModel>(
            builder: (context, lineup, child) {
              return LineUpWidget(lineup: lineup);
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LineUpWidget extends StatefulWidget {
  LineUpWidget({super.key, required this.lineup});

  LineUpModel lineup;

  @override
  State<LineUpWidget> createState() => _LineUpWidgetState();
}

class _LineUpWidgetState extends State<LineUpWidget> {
  @override
  Widget build(BuildContext context) {
    print(
        "rebuildato lineup con titolari n° ${widget.lineup.titolariSize.toString()}");
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SelectModuloLineUp(
            lineup: widget.lineup,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiocatoreWidget(giocatore: widget.lineup.portiere, ruolo: "POR"),
            ],
          ),
          SizedBox(height: 60),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.difensori
                .map((e) => GiocatoreWidget(giocatore: e, ruolo: "DEF"))
                .toList(),
          ),
          SizedBox(height: 80),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.centrocampisti
                .map((e) => GiocatoreWidget(
                      giocatore: e,
                      ruolo: "CEN",
                    ))
                .toList(),
          ),
          SizedBox(height: 80),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.attaccanti
                .map((e) => GiocatoreWidget(
                      giocatore: e,
                      ruolo: "ATT",
                    ))
                .toList(),
          ),
          // Consumer<RosaModel>(
          //   builder: (context, rosa, child) {
          //     return RosaWidget(showRosa: rosa._showRosa);
          //   },
          // )
        ],
      ),
    );
  }
}

// class RosaModel extends ChangeNotifier {
//   bool _showRosa = false;

//   bool get showRosa => _showRosa;

//   void toggleShowRosa() {
//     _showRosa = !_showRosa;
//     notifyListeners();
//   }
// }

class GiocatoreWidget extends StatefulWidget {
  GiocatoreWidget({super.key, required this.giocatore, this.ruolo});

  final Titolare? giocatore;
  final String? ruolo;

  @override
  State<GiocatoreWidget> createState() => _GiocatoreWidgetState();
}

class _GiocatoreWidgetState extends State<GiocatoreWidget> {
  late LineUpModel lineup;

  @override
  void initState() {
    lineup = context.read<LineUpModel>();
    if (lineup.titolariSize != 11) {
      lineup.initTitolari();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lineup = context.read<LineUpModel>();
    List<String> giocPerRuolo = rosa
        .where((element) => element.ruolo == widget.ruolo)
        .map((e) => e.nome)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: widget.giocatore!.nome == null
          ? IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => RosaDialog(
                        rosa: giocPerRuolo,
                        ruolo: widget.ruolo!)).then((response) {
                  print("response: $response");
                  if (response != null) {
                    lineup.setTitolareToIndex(widget.giocatore!.ruolo, response,
                        widget.giocatore!.index);
                  }
                });

                setState(() {});
              },
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 30,
              ))
          : Text(
              widget.giocatore!.nome!,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}

// ignore: must_be_immutable
// class RosaWidget extends StatefulWidget {
//   RosaWidget({super.key, required this.showRosa});

//   bool showRosa;

//   @override
//   State<RosaWidget> createState() => _RosaWidgetState();
// }

// class _RosaWidgetState extends State<RosaWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: AnimatedOpacity(
//         opacity: widget.showRosa ? 1.0 : 0.0,
//         duration: Duration(milliseconds: 500),
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(color: Colors.white),
//           padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//           child: Wrap(
//               alignment: WrapAlignment.spaceEvenly,
//               children: rosa
//                   .map((e) => Text(
//                         e,
//                         style: TextStyle(color: Colors.black),
//                       ))
//                   .toList()),
//         ),
//       ),
//     );
//   }
// }
