import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/cart.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  _BarState createState() => _BarState();
  final FoodViewModel _foodViewModel;
  final MainViewmodel _mainViewmodel;
  Bar(FoodViewModel foodViewModel, MainViewmodel mainViewmodel)
      : _foodViewModel = foodViewModel,
        _mainViewmodel = mainViewmodel;
}

class _BarState extends State<Bar> {
  // _BarState(MainViewmodel mainViewmodel) : _mainViewmodel = mainViewmodel;
  // final MainViewmodel _mainViewmodel;

  //final User user;
  @override
  void _filterFoodList(value) {
    setState(() {
      widget._foodViewModel.filteredFoodList = widget._foodViewModel.foodList
          .where((food) =>
              food['Name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _onsearch(BuildContext context, FoodViewModel viewmodel) async {
    Food searchFood = await viewmodel.getFood(viewmodel.search);
    Navigator.pushNamed(context, '/searchscreen', arguments: searchFood);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        onChanged: (value) {
          widget._foodViewModel.search = value;
        },
        decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Search Food Here",
            hintStyle: TextStyle(color: Colors.black)),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _onsearch(context, widget._foodViewModel)),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/viewcart');
              },
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ],
    );
  }
}
