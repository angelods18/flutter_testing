import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/post.dart';
import 'package:flutter_first_app/services/posts_service.dart';

class PostTablePage extends StatelessWidget {
  const PostTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostTable(),
    );
  }
}

class PostTable extends StatefulWidget {
  @override
  State<PostTable> createState() => _PostTableState();
}

class _PostTableState extends State<PostTable> {
  final PostService httpService = PostService();

  List results = [];

  DataRow _getDataRow(index, Post data) {
    return DataRow(cells: [
      DataCell(Text(data.userId.toString())),
      DataCell(Text(data.title))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Posts"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: FutureBuilder(
              future: httpService.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  results = snapshot.data!;
                  if (snapshot.data!.isNotEmpty) {
                    return Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blue[200]!),
                          columnSpacing: 20,
                          columns: [
                            DataColumn(label: Text('userId')),
                            DataColumn(label: Text('title'))
                          ],
                          rows: List.generate(results.length,
                              (index) => _getDataRow(index, results[index]))),
                    );
                  } else {
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
                } else {
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
              },
            )),
      ),
    );
  }
}
