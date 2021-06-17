import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:exercise3/screens/viewproduct/component/item_image.dart';
import 'package:exercise3/screens/viewproduct/component/order_button.dart';
import 'package:exercise3/screens/viewproduct/component/title_price_rating.dart';
import 'package:exercise3/screens/viewproduct/viewproduct.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({data}) : _data = data;

  final Food _data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: _data.photoUrl,
        ),
        Expanded(
          child: ItemInfo(data: _data),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key key, this.data}) : super(key: key);

  final Food data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopeName(name: data.ownerName),
          TitlePriceRating(
            name: "${data.name}",
            numOfReviews: 24,
            rating: 4,
            price: data.price,
            onRatingChanged: (value) {},
          ),
          Text(
            "${data.description}",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          OrderButton(
            size: size,
            press: () {
              Navigator.pushNamed(context, '/buy');
            },
          )
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
