import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Find Food Near You'), actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.food_bank),
        onPressed: () {},
      ),
    ]));
  }
}
