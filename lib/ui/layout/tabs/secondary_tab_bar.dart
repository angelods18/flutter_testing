import 'package:flutter/material.dart';

class SecondaryTabBar extends StatelessWidget {
  const SecondaryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tab(
              iconMargin: EdgeInsets.zero,
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: Text('info',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
            Tab(
              iconMargin: EdgeInsets.zero,
              icon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.people_alt_sharp,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              child: Text('community',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}
