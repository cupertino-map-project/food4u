import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:flutter/material.dart';

class EmptySection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/success.gif'),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: kLessPadding),
            child: Text(
              "Done",
              style: kDarkTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
