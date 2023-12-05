import 'package:flutter/material.dart';

class NestedWidget extends StatelessWidget {
  const NestedWidget({super.key, required this.innerWidget});

  final Widget innerWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: innerWidget,
    );
  }
}
