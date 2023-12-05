import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/auth/login_page.dart';
import 'package:flutter_first_app/ui/layout/sidebar.dart';
import 'package:flutter_first_app/ui/layout/tabs/simple_tab_bar.dart';
import 'package:flutter_first_app/ui/lines-up/line_up.dart';
import 'package:flutter_first_app/ui/posts/post_table_dio.dart';
import 'package:flutter_first_app/ui/user/user_table.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.defaultTab});

  final int defaultTab;
  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTab = 0;
  final List<String> tabTitleList = ['Login', 'Community', "Line up", "Feed"];
  String currentTitle = '';
  int tabLength = 4;

  @override
  void initState() {
    selectedTab = widget.defaultTab;
    currentTitle = tabTitleList[selectedTab];
    tabController = TabController(length: tabLength, vsync: this);
    tabController.index = selectedTab;
    tabController.addListener(changeTitle);
    super.initState();
  }

  void changeTitle() {
    setState(() {
      currentTitle = tabTitleList[tabController.index];
      selectedTab = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabLength,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(currentTitle),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    context.push('/profile');
                  },
                  icon: Icon(Icons.person_2_sharp))
            ],
            // bottom: SimpleTabBar(
            //   tabController: tabController,
            // ),
          ),
          drawer: Sidebar(),
          bottomNavigationBar: SimpleTabBar(
              tabController: tabController, selectedTab: selectedTab),
          body: TabBarView(
              controller: tabController,
              children: [LoginPage(), UserTable(), LineUp(), PostTableDio()]),
        ));
  }
}
