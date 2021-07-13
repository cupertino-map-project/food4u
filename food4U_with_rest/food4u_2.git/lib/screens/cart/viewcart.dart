import 'package:flutter/material.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/cart/widget/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewCartScreen extends StatelessWidget {
  static const routeName = "/viewcart";
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => ViewCartScreen(data: data));
  Food _data;
  get data => _data;
  ViewCartScreen({data}) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "1 items",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckOutCart(),
    );
  }
}

class CheckOutCart extends StatelessWidget {
  const CheckOutCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      height: 174,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA),
            )
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10),
            ),
            //child: SvgPicture.asset("assets/icons/bag.svg"),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Total:\n",
                  children: [
                    TextSpan(
                        text: "\RM8.00",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
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
          )
        ],
      ),
    );
  }
}
