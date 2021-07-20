import 'package:exercise3/models/food.dart';

import '../../app/dependencies.dart';
import '../../models/food.dart';
import 'food_service.dart';
import '../rest.dart';

class FoodServiceRest implements FoodService {
  RestService get rest => dependency();

  Future<List<Food>> getAllFood() async {
    final List listJson = await rest.get('foods');
    if (listJson == null || listJson.length == 0) return null;
    return listJson.map((json) => Food.fromJson(json)).toList();
  }

  Future<Food> addFood({Food food}) async {
    final newFood = await rest.post('foods', data: food);
    return Food.fromJson(newFood);
  }

  Future<Food> getFood(String name) async {
    String foodsname = 'foods/?name=' + name;
    final List json = await rest.get(foodsname);
    if (json == null || json.length == 0) return null;
    final _result = Food.fromJson(json[0]);
    return _result;
  }
}
