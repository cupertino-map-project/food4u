import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/main_screen.dart';
import 'package:exercise3/screens/viewproduct/component/appbar.dart';
import 'package:exercise3/screens/viewproduct/component/body.dart';
import 'package:flutter/material.dart';

class ViewProductScreen extends StatelessWidget {
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => ViewProductScreen(data: data));

  Food _data;

  get data => _data;

  ViewProductScreen({data}) : _data = data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}

// class ViewProductScreen extends StatefulWidget {
//   static Route route({data}) =>
//       MaterialPageRoute(builder: (context) => ViewProductScreen(data: data));
//   Food _data;

//   get data => _data;

//   ViewProductScreen({data}) : _data = data;

//   @override
//   _ViewProductScreenState createState() => _ViewProductScreenState();
// }

// class _ViewProductScreenState extends State<ViewProductScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: null,
//     );
//   }
// }
