import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/main/counter_viewmodel.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/bar/unsigned_body.dart';
import 'package:flutter/material.dart';

import 'widgets/bar/signed_in_bar.dart';
import 'widgets/bar/unsigned_in_bar.dart';
import 'widgets/body.dart';
import 'widgets/float.dart';
import '../view.dart';
import 'main_viewmodel.dart';

class MainScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => MainScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: MainViewmodel(),
          builder: (_, mainViewmodel, __) {
            if (mainViewmodel.isUserSignedIn) {
              final _foodViewModel =
                  FoodViewModel(mainViewmodel: mainViewmodel);

              return Scaffold(
                appBar: SignedInBar(mainViewmodel),
                body: Body(_foodViewModel),
                //floatingActionButton: Float(_counterViewmodel),
              );
            }

            return Scaffold(
                appBar: UnsignedInBar(mainViewmodel),
                body: UnsignedInBody(mainViewmodel));
          },
        ),
      ),
    );
  }
}
