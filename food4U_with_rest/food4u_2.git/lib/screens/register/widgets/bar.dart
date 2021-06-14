import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Food4U'),
        ],
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue[800])),
          onPressed: () => Navigator.pushNamed(context, '/login'),
          icon: Icon(Icons.person),
          label: Text('Login'),
        )
      ],
    );
  }
}
