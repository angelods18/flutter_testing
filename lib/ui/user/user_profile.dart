import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/commons/rounded_image.dart';
import 'package:flutter_first_app/ui/layout/tabs/secondary_tab_bar.dart';

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
            flex: 4,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ProfileHeader()),
          ),
          Expanded(
            flex: 4,
            child: Text('profile content'),
          ),
          Expanded(flex: 2, child: SecondaryTabBar())
        ],
      ),
    );
  }
}

// header
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
          child: RoundedImage(
              pathToImage: 'assets/asset/images/index.jpg', dimension: 80),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('Angelo De Santis'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProfileHeaderSocialInfoItem(title: 'Follower', value: 15),
              ProfileHeaderSocialInfoItem(title: 'Followings', value: 21),
              ProfileHeaderSocialInfoItem(title: 'Post', value: 3),
            ],
          ),
        )
      ],
    );
  }
}

// Header row item
class ProfileHeaderSocialInfoItem extends StatelessWidget {
  const ProfileHeaderSocialInfoItem(
      {super.key, required this.title, required this.value});

  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value.toString())
        ],
      ),
    );
  }
}
