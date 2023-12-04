import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  child: Text("Ciao Angelo"),
                ),
                SidebarRoutingItem(text: 'Home', icon: Icons.home_filled),
                SidebarRoutingItem(
                    text: 'Profilo', icon: Icons.person_2_rounded),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SidebarRoutingItem extends StatelessWidget {
  const SidebarRoutingItem({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(text), Icon(icon)]),
    );
  }
}
