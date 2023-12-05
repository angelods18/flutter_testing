import 'package:flutter/material.dart';
import 'package:flutter_first_app/ui/layout/homepage.dart';

class BackButtonHome extends StatelessWidget {
  const BackButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const Homepage(defaultTab: 0);
          },
        ));
      },
      icon: const BackButtonIcon(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );
  }
}
