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
}
