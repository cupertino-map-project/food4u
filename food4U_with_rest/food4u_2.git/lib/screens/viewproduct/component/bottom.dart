// import 'package:exercise3/models/cart.dart';
// import 'package:exercise3/models/food.dart';
// import 'package:exercise3/screens/viewproduct/component/order_button.dart';
// import 'package:exercise3/screens/viewproduct/viewproductmodel.dart';
// import 'package:exercise3/shared/pallete.dart';
// import 'package:flutter/material.dart';

// class BottomBar extends StatelessWidget {
//   void onAddToCart(
//       BuildContext context, ViewProductModel viewProductModel) async {
//     final Cart _cart = await viewProductModel.addToCart();
//     if (_cart != null) Navigator.pop(context);
//   }

//   BottomBar({data, viewProductModel})
//       : _data = data,
//         _viewProductModel = viewProductModel;

//   final Food _data;
//   final ViewProductModel _viewProductModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 35, bottom: 25),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           // Container(
//           //   margin: EdgeInsets.only(right: 10),
//           //   padding: EdgeInsets.symmetric(vertical: 30),
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: <Widget>[
//           //       Text("Quantity",
//           //           style: TextStyle(
//           //             fontSize: 14,
//           //             fontWeight: FontWeight.w700,
//           //           )),
//           //       CustomQuantityWidget(state: this),
//           //     ],
//           //   ),
//           // ),
//           TextButton(
//             onPressed: () => onAddToCart(context, _viewProductModel),
//             child: Text(
//               'Add To Cart',
//               style: kBodyText.copyWith(
//                   fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class CustomQuantityWidget extends StatefulWidget {
// //   CustomQuantityWidget({state}) : _state = state;
// //   final BottomBar _state;

// //   @override
// //   _CustomQuantityWidgetState createState() => _CustomQuantityWidgetState();
// // }

// // class _CustomQuantityWidgetState extends State<CustomQuantityWidget> {
// //   double _buttonWidth = 30;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(right: 25),
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.black, width: 2),
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       padding: EdgeInsets.symmetric(vertical: 5),
// //       width: 120,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: <Widget>[
// //           SizedBox(
// //             width: _buttonWidth,
// //             height: _buttonWidth,
// //             child: FlatButton(
// //               padding: EdgeInsets.all(0),
// //               onPressed: () {
// //                 setState(() {
// //                   if (widget._state._viewProductModel.numOfItem > 1) {
// //                     widget._state._viewProductModel.numOfItem--;
// //                   }
// //                 });
// //               },
// //               child: Text(
// //                 "-",
// //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
// //               ),
// //             ),
// //           ),
// //           Text(
// //             widget._state._viewProductModel.numOfItem.toString(),
// //             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
// //           ),
// //           SizedBox(
// //             width: _buttonWidth,
// //             height: _buttonWidth,
// //             child: FlatButton(
// //               padding: EdgeInsets.all(0),
// //               onPressed: () {
// //                 setState(() {
// //                   widget._state._viewProductModel.numOfItem++;
// //                 });
// //               },
// //               child: Text(
// //                 "+",
// //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
