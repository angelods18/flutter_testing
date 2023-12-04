import 'package:flutter/material.dart';
import 'package:flutter_first_app/route_app.dart';
import 'package:flutter_first_app/ui/auth/registration_page.dart';
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
  final List<String> tabTitleList = ['_Feed', 'Login', 'Registrazione'];
  String currentTitle = '';

  @override
  void initState() {
    selectedTab = 0;
    currentTitle = tabTitleList[0];
    tabController = TabController(length: 3, vsync: this);
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Center(
              child: Text(currentTitle),
            ),
            // bottom: SimpleTabBar(
            //   tabController: tabController,
            // ),
          ),
          bottomNavigationBar: SimpleTabBar(
              tabController: tabController, selectedTab: selectedTab),
          body: TabBarView(controller: tabController, children: const [
            PostTableDio(),
            LoginPage(),
            RegistrationPage()
          ]),
        ));
  }
}
