import 'package:exercise3/screens/Add%20Product/widgets/body.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => AddProductScreen());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: AddProductBody(),
        ),
      ),
    );
  }
}
