import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/commons/no_data_found.dart';

class FutureListView extends StatelessWidget {
  const FutureListView(
      {super.key,
      required this.futureData,
      required this.titleField,
      required this.subtitleField});

  final Future<dynamic>
      futureData; //pass any Future<List<CLASS>> with toJson method implemented
  final String titleField;
  final String subtitleField;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final list = snapshot.data!;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var item = list[index].toJson();
                  return ListTile(
                    title: Text(item[titleField]),
                    subtitle: Text("n° ${item[subtitleField]}"),
                  );
                });
          } else {
            return NoDataFoundWidget();
          }
        });
  }
}
