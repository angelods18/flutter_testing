import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/posts_service.dart';
import 'package:flutter_first_app/ui/commons/no_data_found.dart';

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
                  return Center(child: const CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final todos = snapshot.data!;
                  return PostTableContainer(results: todos);
                } else {
                  return NoDataFoundWidget();
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
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 10.0),
        child: Text(data.userId.toString()),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Text(data.title),
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.blue[200]!),
          dataRowMinHeight: 60,
          dataRowMaxHeight: 80,
          columnSpacing: 20,
          columns: [
            DataColumn(
                label: Expanded(
              child: Center(
                  child: Text(
                'userId',
                textAlign: TextAlign.center,
              )),
            )),
            DataColumn(
                label: Expanded(
              child: Center(
                child: Text(
                  'title',
                  textAlign: TextAlign.center,
                ),
              ),
            ))
          ],
          rows: List.generate(
              results.length, (index) => _getDataRow(index, results[index]))),
    );
  }
}
