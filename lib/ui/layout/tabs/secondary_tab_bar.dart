import 'package:flutter/material.dart';

class SecondaryTabBar extends StatelessWidget {
  const SecondaryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tab(
              text: "info",
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.info_outline),
              ),
            ),
            Tab(
              text: "community",
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.people_alt_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
