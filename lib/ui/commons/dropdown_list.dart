import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key, required this.list});

  final List list; // object with text and value fields

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  dynamic dropDownValue;

  @override
  void initState() {
    dropDownValue = widget.list.first['value'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: DropdownButton(
            value: dropDownValue,
            items: widget.list.map((dynamic e) {
              return DropdownMenuItem<dynamic>(
                value: e['value'],
                child: Text(e['text']),
              );
            }).toList(),
            onChanged: (dynamic value) {
              setState(() {
                // print(value);
                dropDownValue = value!;
              });
            }),
      ),
    );
  }
}
