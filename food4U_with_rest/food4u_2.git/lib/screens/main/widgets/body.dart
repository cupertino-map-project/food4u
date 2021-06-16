import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/food_tile.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final FoodViewModel _foodViewModel;
  const Body(FoodViewModel foodViewModel) : _foodViewModel = foodViewModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: _foodViewModel.futureFoodList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _foodViewModel.foodList = snapshot.data;
          return _buildFoodListView();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      //FoodList(),
    );
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text('You have pushed the button this many times:'),
    //       SizedBox(
    //         height: 100.0,
    //         child: View(
    //             viewmodel: _viewmodel,
    //             builder: (_, viewmodel, __) => Text(
    //                 '${viewmodel.counter.counter}',
    //                 style: Theme.of(context).textTheme.headline4)),
    //       ),
    //     ],
    //   ),
    // );
  }

  ListView _buildFoodListView() {
    return ListView.builder(
      itemCount: _foodViewModel.foodList.length,
      itemBuilder: (context, index) {
        return FoodTile(food: _foodViewModel.foodList[index]);
      },
    );
  }
}
