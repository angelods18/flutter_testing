import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/lineup.dart';

// ignore: must_be_immutable
class SelectModuloLineUp extends StatelessWidget {
  SelectModuloLineUp({super.key, required this.lineup});

  LineUpModel lineup;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child:
              //
              Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 2.0,
              ),
              child: DropdownButton(
                  underline: Container(
                    height: 2,
                    color: Color.fromARGB(255, 17, 72, 4),
                  ),
                  value: lineup.modulo,
                  items: lineup.moduliList.map((dynamic e) {
                    return DropdownMenuItem<dynamic>(
                      value: e,
                      child: Center(child: Text(e)),
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    lineup.setModulo(value);
                  }),
            ),
          )),
    );
  }
}
