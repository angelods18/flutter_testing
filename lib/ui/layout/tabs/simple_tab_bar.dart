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
              icon: selectedTab == 0
                  ? Icon(
                      Icons.home_filled,
                      color: Colors.greenAccent,
                    )
                  : Icon(Icons.home_outlined)),
          Tab(
              icon: selectedTab == 1
                  ? Icon(
                      Icons.search_rounded,
                      color: Colors.greenAccent,
                    )
                  : Icon(Icons.search_outlined)),
          Tab(
              icon: selectedTab == 2
                  ? Icon(Icons.person_2_rounded, color: Colors.greenAccent)
                  : Icon(Icons.person_2_outlined))
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
