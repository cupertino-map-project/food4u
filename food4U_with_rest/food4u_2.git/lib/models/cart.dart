import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/food.dart';

class Cart extends ChangeNotifier {
  // int _counter = MaterialApp.sharedPrefe;
  final Food food;
  final int numOfItem;

  Cart({@required this.food, @required this.numOfItem});
}
