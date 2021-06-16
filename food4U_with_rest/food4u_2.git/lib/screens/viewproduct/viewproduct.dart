import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/main_screen.dart';
import 'package:exercise3/screens/viewproduct/component/appbar.dart';
import 'package:exercise3/screens/viewproduct/component/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context, null),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/images/share.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/images/more.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(data: this.data),
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
