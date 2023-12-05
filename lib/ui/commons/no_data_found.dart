import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        SizedBox(
          // ignore: sort_child_properties_last
          child: CircularProgressIndicator(),
          width: 30,
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.all(40),
          child: Text('No Data Found...'),
        ),
      ],
    );
  }
}
