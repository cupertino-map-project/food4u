import 'package:flutter/material.dart';
import 'package:food4u/screen/HomePage/home_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/firstscreen':
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  }
  return null;
}
