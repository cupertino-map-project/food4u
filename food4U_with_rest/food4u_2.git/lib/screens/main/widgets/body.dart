import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/food_tile.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/services/food/food_service.dart';
import 'package:exercise3/services/food/food_service_rest.dart';
import 'package:exercise3/shared/loading.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final FoodViewModel _foodViewModel;
  const Body(FoodViewModel foodViewModel) : _foodViewModel = foodViewModel;

  // void initState() {
  //   FoodServiceRest().getAllFood().then((value) => widget._foodViewModel
  //       .foodList = widget._foodViewModel.filteredFoodList = value);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: _foodViewModel.futureFoodList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _foodViewModel.foodList = snapshot.data;
          _foodViewModel.filteredFoodList = snapshot.data;
          // _foodViewModel.foodList;
          return _buildFoodListView();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      //FoodList(),
    );
  }

  ListView _buildFoodListView() {
    if (_foodViewModel.foodList.length > 0)
      return ListView.builder(
        itemCount: _foodViewModel.foodList.length,
        itemBuilder: (context, index) {
          return FoodTile(food: _foodViewModel.foodList[index]);
        },
      );
    else
      Loading();
  }
}
