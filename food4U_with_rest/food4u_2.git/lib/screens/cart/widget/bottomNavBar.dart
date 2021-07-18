import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../view.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({MainViewmodel mainViewmodel})
      : _mainViewmodel = mainViewmodel;

  final MainViewmodel _mainViewmodel;

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: MainViewmodel(),
      builder: (_, _mainViewmodel, __) {
        double total = 0.0;

        for (var i = 0; i < _mainViewmodel.user.cartList.length; i++) {
          total += double.parse(_mainViewmodel.user.cartList[i].price);
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "\RM$total\0",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 190,
              child: FloatingActionButton.extended(
                  icon: Icon(
                    Icons.directions_car_outlined,
                    size: 20.0,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/buy');
                  },
                  label: const Text('Check out')
                  //text: "Check Out",
                  // press: () {},
                  ),
            )
          ],
        );
      },
    );
  }
}
