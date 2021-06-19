import 'package:exercise3/models/food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // int _counter = MaterialApp.sharedPrefe;
  final Food food;
  final int numOfItem;

  Cart({@required this.food, @required this.numOfItem});
}
