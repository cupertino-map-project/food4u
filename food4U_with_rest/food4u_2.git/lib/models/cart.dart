import 'package:exercise3/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart {
  // int _counter = MaterialApp.sharedPrefe;
  List<dynamic> _food;
  List<Food> _foodList = [];
  // List<int> _numOfItem = [];

  get food => _food;
  set food(value) => _food = value;

  void setFood(String value) {
    _food.add(value);
  }

  get foodList => _foodList;

  void setFoodList({Food value}) {
    _foodList.add(value);
  }

  // get numOfItem => _numOfItem;
  // set numOfItem(value) => _numOfItem = value;

  // void setNumOfItemList({int value}) {
  //   _numOfItem.add(value);
  // }

  Cart({List food, List numOfItem}) : _food = food;

  Cart.copy(Cart from) : this(food: from.food);

  Cart.fromJson(Map<String, dynamic> json)
      : this(
          food: json['food'],
        );

  Map<String, dynamic> toJson() => {
        'food': food,
      };
}
