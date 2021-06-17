import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/buy/viewbuy.dart';
import 'package:exercise3/screens/register/register_screen.dart';
import 'package:exercise3/screens/viewproduct/viewproduct.dart';
import 'package:exercise3/screens/cart/viewcart.dart';
import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/main':
      return MainScreen.route();

    case '/login':
      return LoginScreen.route();

    case '/register':
      return RegisterScreen.route();

    case '/viewproduct':
      return ViewProductScreen.route(data: settings.arguments as Food);

    case '/viewcart':
      return ViewCartScreen.route();

    case '/buy':
      return PaymentDetails.route();
  }
  return null;
}
