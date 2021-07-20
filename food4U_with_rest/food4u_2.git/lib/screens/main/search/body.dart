import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/food_tile.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final FoodViewModel _viewmodel;
  final Food _name;
  const Body(FoodViewModel viewmodel, name)
      : _viewmodel = viewmodel,
        _name = name;

  @override
  _BodyState createState() => _BodyState(_viewmodel, _name);
}

class _BodyState extends State<Body> {
  final FoodViewModel _viewmodel;
  final Food _name;
  _BodyState(FoodViewModel viewmodel, name)
      : _viewmodel = viewmodel,
        _name = name;

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: FoodViewModel(),
      builder: (context, _viewmodel, _) => _buildFoodListView(),
    );
  }

  ListView _buildFoodListView() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return FoodTile(food: _name);
      },
    );
  }
}
