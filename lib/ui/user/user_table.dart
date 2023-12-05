import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/User.dart';
import 'package:flutter_first_app/services/user_service.dart';
import 'package:flutter_first_app/ui/commons/no_data_found.dart';

class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => UserTableState();
}

class UserTableState extends State<UserTable> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    futureUsers = UserService().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FutureBuilder(
                    future: futureUsers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: const CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        final users = snapshot.data!;
                        return UserTableContainer(results: users);
                      } else {
                        return NoDataFoundWidget();
                      }
                    }))));
  }
}

class UserTableContainer extends StatelessWidget {
  const UserTableContainer({super.key, required this.results});

  final List<User> results;

  TableRow _getDataRow(index, User data) {
    return TableRow(children: [
      SizedBox(
        width: 30,
        child: Center(
          child: Text(
            data.id.toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          data.username,
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<TableRow> rows = [
      TableRow(children: [
        Text(
          'id',
          textAlign: TextAlign.center,
        ),
        Text(
          'username',
          textAlign: TextAlign.center,
        )
      ])
    ];
    rows.addAll(List.generate(
            results.length, (index) => _getDataRow(index, results[index]))
        .toList());
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Table(
        defaultColumnWidth: const IntrinsicColumnWidth(),
        border: TableBorder.all(color: Colors.lightGreenAccent),
        children: rows,
      ),
    );
  }
}
