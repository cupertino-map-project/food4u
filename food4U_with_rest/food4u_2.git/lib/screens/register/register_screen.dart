import 'package:exercise3/screens/register/register_viewmodel.dart';
import 'package:exercise3/screens/register/widgets/bar.dart';
import 'package:exercise3/screens/register/widgets/body.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/loading.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
            viewmodel: RegisterViewModel(),
            builder: (_, viewModel, __) {
              return Scaffold(
                body: RegisterBody(viewModel),
                appBar: Bar(),
              );
            }),
      ),
    );
  }
}
