import 'package:exercise3/screens/buy/widget/defaultbutton.dart';
import 'package:exercise3/screens/buy/widget/emptysection.dart';
import 'package:exercise3/screens/buy/widget/subtitle.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  final String _text;
  Success({String text}) : _text = text;

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(),
          SubTitle(
            subTitleText: widget._text,
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () => Navigator.pushNamed(context, '/main'),
          ),
        ],
      ),
    );
  }
}
