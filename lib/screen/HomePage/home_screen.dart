import 'package:flutter/material.dart';

// import '../../models/todo.dart';
import 'bar.dart';
import 'body.dart';
import 'bottom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
