import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:flutter/material.dart';

class Float extends StatelessWidget {
  final MainViewmodel _mainViewmodel;
  const Float({MainViewmodel mainViewmodel}) : _mainViewmodel = mainViewmodel;
  @override
  Widget build(BuildContext context) {
    if (_mainViewmodel.user.roles == "seller") {
      return FloatingActionButton.extended(
        icon: Icon(Icons.add_circle_sharp),
        label: const Text('Add Product'),
        backgroundColor: Colors.blue[600],
        onPressed: () {},
      );
    } else {
      return Container();
    }
  }
}
