import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/models/cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //child: Image.asset()
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title", style: TextStyle(fontSize: 16), maxLines: 2),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "//Price",
                style: TextStyle(color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " xNumOFITEM", style: TextStyle(color: kTextColor))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
