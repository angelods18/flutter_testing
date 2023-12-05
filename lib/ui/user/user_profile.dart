import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/layout/tabs/secondary_tab_bar.dart';
import 'package:flutter_first_app/ui/user/user_header.dart';
import 'package:flutter_first_app/ui/user/user_profile_body.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilo'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ProfileHeader()),
          ),
          Expanded(
            flex: 5,
            child: UserProfileBody(userId: 1),
          ),
          Expanded(flex: 1, child: SecondaryTabBar()),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
