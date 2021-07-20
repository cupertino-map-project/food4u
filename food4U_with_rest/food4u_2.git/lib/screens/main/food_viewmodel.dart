import 'package:exercise3/models/food.dart';
import 'package:exercise3/services/food/food_service.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../viewmodel.dart';
import 'main_viewmodel.dart';

class FoodViewModel extends Viewmodel {
  final MainViewmodel _mainViewmodel;
  FoodViewModel({mainViewmodel}) : _mainViewmodel = mainViewmodel {
    _listFood();
  }
  String _search;
  bool _isSearching = false;
  get isSearching => _isSearching;
  set isSearching(value) => _isSearching = value;

  FoodService get service => dependency();

  List<Food> _foodList;
  get foodList => _foodList;
  set foodList(value) => _foodList = value;

  // List<Food> filteredSearchFood({
  //   @required String filter,
  // }) {
  //   if (filter != null && filter.isNotEmpty) {
  //     return _searchHistory.reversed
  //         .where((term) => term.startsWith(filter))
  //         .toList();
  //   }
  //   else{
  //     return _searchHistory.reversed.toList();
  //   }
  //   }
  // }

  List<Food> _filteredFoodList;
  get filteredFoodList => _filteredFoodList;
  set filteredFoodList(value) => _filteredFoodList = value;

  Future<List<Food>> _futureFoodList;
  get futureFoodList => _futureFoodList;
  set futureFoodList(value) => _futureFoodList = value;

  User get user => _mainViewmodel.user;

  void _listFood() => (_futureFoodList = service.getAllFood());
  String selectedTerm;

  get search => _search;
  set search(value) {
    _search = value;
    print(search);
  }

  Future<Food> getFood(String foodsname) async {
    final Food result = await service.getFood(foodsname);
    return result;
  }
}
