import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/cart.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  _BarState createState() => _BarState();
  final FoodViewModel _foodViewModel;
  Bar(FoodViewModel foodViewModel) : _foodViewModel = foodViewModel;
}

class _BarState extends State<Bar> {
  @override
  void _filterFoodList(value) {
    setState(() {
      widget._foodViewModel.filteredFoodList = widget._foodViewModel.foodList
          .where((food) =>
              food['Name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: !widget._foodViewModel.isSearching
          ? Text('Find Food Near You')
          : TextField(
              onChanged: (value) {
                _filterFoodList(value);
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Search Food Here",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
      actions: <Widget>[
        widget._foodViewModel.isSearching
            ? IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    this.widget._foodViewModel.isSearching = false;
                    widget._foodViewModel.filteredFoodList =
                        widget._foodViewModel.foodList;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    this.widget._foodViewModel.isSearching = true;
                  });
                },
              ),
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
