import 'package:exercise3/models/cart.dart';

import '../../models/food.dart';

abstract class FoodService {
  Future<List<Food>> getAllFood();
  Future<Food> addFood({Food food});
  Future<Food> getFood(String name);
}
