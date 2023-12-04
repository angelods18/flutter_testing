import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/posts_service.dart';

class PostTableDio extends StatefulWidget {
  const PostTableDio({super.key});

  @override
  State<PostTableDio> createState() => PostTableState();
}

class PostTableState extends State<PostTableDio> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    futurePosts = PostService().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: FutureBuilder(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final todos = snapshot.data!;
                  return PostTableContainer(results: todos);
                } else {
                  return NoPostFoundWidget();
                }
              }),
        ),
      ),
    );
  }
}

class PostTableContainer extends StatelessWidget {
  const PostTableContainer({super.key, required this.results});

  final List<Post> results;
  DataRow _getDataRow(index, Post data) {
    return DataRow(cells: [
      DataCell(Text(data.userId.toString())),
      DataCell(Text(data.title))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.blue[200]!),
          columnSpacing: 20,
          columns: [
            DataColumn(label: Text('userId')),
            DataColumn(label: Text('title'))
          ],
          rows: List.generate(
              results.length, (index) => _getDataRow(index, results[index]))),
    );
  }
}

class NoPostFoundWidget extends StatelessWidget {
  const NoPostFoundWidget({super.key});

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
