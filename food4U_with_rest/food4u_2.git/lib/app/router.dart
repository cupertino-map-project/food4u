import 'package:exercise3/screens/register/register_screen.dart';
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
  }
  return null;
}
