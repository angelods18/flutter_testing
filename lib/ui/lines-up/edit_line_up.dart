import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/lineup.dart';
import 'package:flutter_first_app/ui/lines-up/rosa_dialog.dart';
import 'package:flutter_first_app/ui/lines-up/select_module.dart';
import 'package:provider/provider.dart';

const List<String> rosa = [
  'POR1',
  'POR2',
  'POR3',
  'DIF1',
  'DIF2',
  'DIF3',
  'DIF4',
  'DIF5',
  'CEN1',
  'CEN2',
  'CEN3',
  'CEN4',
  'CEN5',
  'ATT1',
  'ATT2',
  'ATT3',
  'ATT4',
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

class LineUpWidget extends StatefulWidget {
  LineUpWidget({super.key, required this.lineup});

  final LineUpModel lineup;

  @override
  State<LineUpWidget> createState() => _LineUpWidgetState();
}

class _LineUpWidgetState extends State<LineUpWidget> {
  @override
  Widget build(BuildContext context) {
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
              GiocatoreWidget(giocatore: widget.lineup.portiere),
            ],
          ),
          SizedBox(height: 60),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.difensori
                .map((e) => GiocatoreWidget(giocatore: e))
                .toList(),
          ),
          SizedBox(height: 80),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.centrocampisti
                .map((e) => GiocatoreWidget(giocatore: e))
                .toList(),
          ),
          SizedBox(height: 80),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widget.lineup.attaccanti
                .map((e) => GiocatoreWidget(
                      giocatore: e,
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
  GiocatoreWidget({super.key, required this.giocatore});

  final Titolare? giocatore;
  @override
  State<GiocatoreWidget> createState() => _GiocatoreWidgetState();
}

class _GiocatoreWidgetState extends State<GiocatoreWidget> {
  @override
  Widget build(BuildContext context) {
    var lineup = context.read<LineUpModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: widget.giocatore!.nome == null
          ? IconButton(
              onPressed: () {
                showDialog(
                        context: context,
                        builder: (context) => RosaDialog(rosa: rosa))
                    .then((response) {
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
