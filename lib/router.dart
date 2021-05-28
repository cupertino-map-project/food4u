import 'package:flutter/material.dart';
import 'package:food4u/screen/HomePage/home_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/firstscreen':
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );

    /*
    case '/secondscreen':
      return MaterialPageRoute(
        builder: (context) => TaskListScreen(todo: settings.arguments),
      );
      */
  }
  return null;
}
