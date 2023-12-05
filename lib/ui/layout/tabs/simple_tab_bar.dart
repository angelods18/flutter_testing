import 'package:flutter/material.dart';

class SimpleTabBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleTabBar(
      {super.key, required this.tabController, required this.selectedTab});

  final TabController tabController;
  final int selectedTab;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        indicatorColor: Colors.greenAccent,
        tabs: [
          Tab(
              text: 'home',
              icon: selectedTab == 0
                  ? Icon(
                      Icons.home_filled,
                      color: Colors.greenAccent,
                    )
                  : Icon(Icons.home_outlined)),
          Tab(
              text: 'community',
              icon: selectedTab == 1
                  ? Icon(
                      Icons.people,
                      color: Colors.greenAccent,
                    )
                  : Icon(Icons.people_alt_outlined)),
          Tab(
              text: 'feed',
              icon: selectedTab == 2
                  ? Icon(
                      Icons.note_rounded,
                      color: Colors.greenAccent,
                    )
                  : Icon(Icons.note_outlined)),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
