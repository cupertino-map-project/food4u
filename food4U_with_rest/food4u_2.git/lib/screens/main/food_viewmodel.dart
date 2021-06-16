import 'package:exercise3/models/food.dart';
import 'package:exercise3/services/food/food_service.dart';

import '../../app/dependencies.dart';
import '../../services/counter/counter_service.dart';
import '../../models/user.dart';
import '../../models/counter.dart';
import '../viewmodel.dart';
import 'main_viewmodel.dart';

class FoodViewModel extends Viewmodel {
  final MainViewmodel _mainViewmodel;
  FoodViewModel({mainViewmodel}) : _mainViewmodel = mainViewmodel {
    _listFood();
  }

  bool _isSearching = false;
  get isSearching => _isSearching;
  set isSearching(value) => _isSearching = value;

  FoodService get service => dependency();

  List<Food> _foodList;
  get foodList => _foodList;
  set foodList(value) => _foodList = value;

  List<Food> _filteredFoodList;
  get filteredFoodList => _filteredFoodList;
  set filteredFoodList(value) => _filteredFoodList = value;

  Future<List<Food>> _futureFoodList;
  get futureFoodList => _futureFoodList;
  set futureFoodList(value) => _futureFoodList = value;

  User get user => _mainViewmodel.user;

  void _listFood() => (_futureFoodList = service.getAllFood());
}
