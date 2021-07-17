import 'package:exercise3/models/cart.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/viewproduct/component/constants.dart';
import 'package:exercise3/screens/viewproduct/component/item_image.dart';
import 'package:exercise3/screens/viewproduct/component/order_button.dart';
import 'package:exercise3/screens/viewproduct/component/title_price_rating.dart';
import 'package:exercise3/screens/viewproduct/viewproduct.dart';
import 'package:exercise3/screens/viewproduct/viewproductmodel.dart';
import 'package:exercise3/shared/pallete.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({data, viewProductModel})
      : _data = data,
        _viewProductModel = viewProductModel;

  final Food _data;
  final ViewProductModel _viewProductModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: _data.photoUrl,
        ),
        Expanded(
          child: ItemInfo(_data, _viewProductModel),
        ),
      ],
    );
  }
}

class ItemInfo extends StatefulWidget {
  const ItemInfo(Food data, ViewProductModel viewProductModel)
      : _viewProductModel = viewProductModel,
        _data = data;

  final ViewProductModel _viewProductModel;
  final Food _data;

  @override
  _ItemInfoState createState() => _ItemInfoState(_data, _viewProductModel);
}

class _ItemInfoState extends State<ItemInfo> {
  final Food _data;
  final ViewProductModel _viewProductModel;

  _ItemInfoState(Food data, ViewProductModel viewProductModel)
      : _data = data,
        _viewProductModel = viewProductModel;

  void onAddToCart(ViewProductModel viewProductModel, Food food) {
    print("food id " + food.id);
    print(" user id " + _viewProductModel.user.id);
    setState(() {
      _viewProductModel.user.setCart(food);
      _viewProductModel.user.setCartCode(food.id);
    });
    _viewProductModel.updateUser(_viewProductModel.user);
    Navigator.pop(context, _viewProductModel.user);
  }

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
          shopeName(name: _data.ownerName),
          TitlePriceRating(
            name: "${_data.name}",
            numOfReviews: 24,
            rating: 4,
            price: _data.price,
            onRatingChanged: (value) {},
          ),
          Text(
            "${_data.description}",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          TextButton(
            onPressed: () => onAddToCart(_viewProductModel, _data),
            child: Text(
              'Add To Cart',
              style: kBodyText.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
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
