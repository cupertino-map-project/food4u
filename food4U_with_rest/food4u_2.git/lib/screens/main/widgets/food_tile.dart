import 'package:flutter/material.dart';
import '../../../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;

  FoodTile({this.food});

  void _todetail(BuildContext context, _id) {
    Navigator.pushNamed(context, '/viewproduct', arguments: Food.copy(food));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 70,
              minHeight: 60,
              maxWidth: 70,
              maxHeight: 60,
            ),
            child: Image.asset('${food.photoUrl}', fit: BoxFit.cover),
          ),
          title: Text(
            '${food.name}',
            style: TextStyle(fontSize: 20.0),
          ),
          subtitle: Text('${food.ownerName}'),
          trailing: Text('RM${food.price}'),
          onTap: () => _todetail(context, food),
        ),
      ),
    );
  }
}
