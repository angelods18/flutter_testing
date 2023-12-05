// header
import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/commons/rounded_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: RoundedImage(
              pathToImage: 'assets/asset/images/index.jpg', dimension: 80),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text('Angelo De Santis'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
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
