import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/auth/login_page.dart';
import 'package:flutter_first_app/ui/layout/sidebar.dart';
import 'package:flutter_first_app/ui/layout/tabs/simple_tab_bar.dart';
import 'package:flutter_first_app/ui/posts/post_table_dio.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTab = 0;
  final List<String> tabTitleList = ['Login', "Feed"];
  String currentTitle = '';

  @override
  void initState() {
    selectedTab = 0;
    currentTitle = tabTitleList[0];
    tabController = TabController(length: 2, vsync: this);
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Text(currentTitle),
            centerTitle: true,
            // bottom: SimpleTabBar(
            //   tabController: tabController,
            // ),
          ),
          drawer: Sidebar(),
          bottomNavigationBar: SimpleTabBar(
              tabController: tabController, selectedTab: selectedTab),
          body: TabBarView(
              controller: tabController,
              children: [LoginPage(), PostTableDio()]),
        ));
  }
}
