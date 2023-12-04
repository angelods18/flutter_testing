import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';

class PostAlert extends StatelessWidget {
  PostAlert(this.post);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(post.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: [Text(post.body)],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("chiudi"))
      ],
    );
  }
}
