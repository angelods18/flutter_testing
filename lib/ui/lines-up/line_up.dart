import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/commons/dropdown_list.dart';

const List<dynamic> modulesList = [
  {'text': '3-4-3', 'value': '3-4-3'},
  {'text': '4-3-3', 'value': '4-3-3'},
  {'text': '4-4-2', 'value': '4-4-2'},
  {'text': '4-5-1', 'value': '4-5-1'},
  {'text': '3-5-2', 'value': '3-5-2'},
];

class LineUp extends StatelessWidget {
  const LineUp({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: DropDownList(list: modulesList),
              )
            ],
          ),
        ),
      ),
    );
  }
}
