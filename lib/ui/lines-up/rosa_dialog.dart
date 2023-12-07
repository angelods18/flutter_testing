import 'package:flutter/material.dart';

class RosaDialog extends StatelessWidget {
  const RosaDialog({super.key, required this.rosa, required this.ruolo});

  final List<String> rosa;
  final String ruolo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Seleziona il giocatore da inserire'),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 40,
                child: ListView.builder(
                    itemCount: rosa.length,
                    itemBuilder: (context, index) {
                      String g = rosa[index];
                      return ListTile(
                        title: Text(g),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.pop(context, g);
                          },
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
