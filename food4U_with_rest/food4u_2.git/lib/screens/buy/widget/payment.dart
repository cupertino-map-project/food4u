import 'package:exercise3/screens/buy/widget/defaultbutton.dart';
import 'package:exercise3/screens/buy/widget/stickylabel.dart';
import 'package:exercise3/screens/buy/widget/success.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';

import 'package:flutter/material.dart';

import 'defaultAppBar.dart';
import 'defaultBackButton.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i),
                  ),
                  title: Text(
                    "Pay Using COD",
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing:
                      Icon(Icons.money_off_csred_sharp, color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          DefaultButton(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
