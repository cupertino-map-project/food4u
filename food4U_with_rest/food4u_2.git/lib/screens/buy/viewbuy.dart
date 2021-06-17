import 'package:exercise3/screens/buy/widget/defaultAppBar.dart';
import 'package:exercise3/screens/buy/widget/defaultBackButton.dart';
import 'package:exercise3/screens/buy/widget/payment.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';

import 'package:exercise3/screens/buy/widget/stickylabel.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';

import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  static const routeName = "/buy";
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => PaymentDetails());

  PaymentDetails({Key key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Payment Details",
        child: DefaultBackButton(),
      ),
      body: Payment(),
    );
  }
}
