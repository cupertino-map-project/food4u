import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/cart.dart';
import 'package:exercise3/screens/cart/widget/cart_item_card.dart';

class Body extends StatelessWidget {
  const Body({data}) : _data = data;

  final Food _data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dismissible(

        CartItemCard(),

        // ),
      ],
    );
  }
}
