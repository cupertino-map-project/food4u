import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/bar/bar.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'search/body.dart';

class SearchScreen extends StatefulWidget {
  final _name;

  SearchScreen({name}) : _name = name;

  static Route route({name}) => MaterialPageRoute(
      builder: (context) => SearchScreen(
            name: name,
          ));

  @override
  _SearchScreenState createState() => _SearchScreenState(name: _name);
}

class _SearchScreenState extends State<SearchScreen> {
  _SearchScreenState({name}) : _name = name;

  Food _name;

  get food => _name;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: View(
              viewmodel: FoodViewModel(),
              builder: (_, foodViewmodel, __) {
                // mainViewmodel.setUser(widget._user);
                return Scaffold(
                  body: Body(foodViewmodel, food),
                  floatingActionButton: FloatingActionButton.extended(
                    icon: Icon(Icons.arrow_back),
                    label: const Text('Back to Home'),
                    backgroundColor: Colors.blue[600],
                    onPressed: () => Navigator.pop(context),
                  ),
                );
              }),
        ));
  }
}
