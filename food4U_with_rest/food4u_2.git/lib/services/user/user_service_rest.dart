import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/cart.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/services/user/user_service.dart';
import '../rest.dart';

class UserServiceRest implements UserService {
  RestService get rest => dependency();

  Future<User> getUserByID(dynamic userId) async {
    print('ID adalah $userId');
    final List listJson = await rest.get('users?id=$userId');
    if (listJson == null || listJson.length == 0) return null;
    return User.fromJson(listJson[0]);
  }

  Future<User> updateUser({User user}) async {
    final json = await rest.put('users/${user.id}', data: user);
    return User.fromJson(json);
  }

  Future<Food> getFoodbyID({String foodId}) async {
    final json = await rest.get('foods/$foodId');
    if (json == null || json.length == 0) return null;
    final _food = Food.fromJson(json);
    print("Dah jadi");
    return _food;
  }
}
