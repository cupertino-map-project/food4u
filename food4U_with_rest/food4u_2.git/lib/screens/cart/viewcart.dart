import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

import 'package:exercise3/screens/cart/widget/body.dart';

class ViewCartScreen extends StatelessWidget {
  static const routeName = "/viewcart";
  static Route route() =>
      MaterialPageRoute(builder: (context) => ViewCartScreen());

  //final User _user;
  //ViewCartScreen({user}) : _user = user;

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: MainViewmodel(),
        builder: (_, mainViewModel, __) {
          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  Text(
                    "Your Cart",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    mainViewModel.user.cartList.length.toString() + " items",
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
            body: Body(mainViewmodel: mainViewModel),
            bottomNavigationBar: CheckOutCart(),
          );
        });
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
