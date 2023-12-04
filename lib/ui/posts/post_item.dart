import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/ui/posts/post_alert.dart';

class PostItem extends StatelessWidget {
  PostItem(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 80,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 2.0),
                  child: Text(post.title),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 1.0),
                    child: Text(
                      "post di ${post.userId}",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            ),
            Positioned(
                right: 10.0,
                top: 10.0,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                        onPressed: () {
                          print("post di ${post.userId}");
                          _showPostDialog(context, post);
                        },
                        icon: const Icon(Icons.info_outline_rounded)),
                  ),
                ))
          ],
        ));
  }
}

Future<void> _showPostDialog(BuildContext context, Post post) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return PostAlert(post);
      });
}
