import '../../models/food.dart';

abstract class FoodService {
  Future<List<Food>> getAllFood();
  Future<Food> addFood({Food food});
}
