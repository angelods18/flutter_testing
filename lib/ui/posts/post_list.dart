import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/posts_service.dart';
import 'package:flutter_first_app/ui/posts/post_item.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostList(),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Post page')),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 150,
                child: Image.asset('assets/asset/images/index.jpg'),
              ),
            ),
            PostListData()
          ],
        ),
      ),
    );
  }
}

class PostListData extends StatelessWidget {
  final PostService httpService = PostService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: FutureBuilder(
        future: httpService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post> postList = snapshot.data!;
            return Column(
              children: postList.map((Post e) => PostItem(e)).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
