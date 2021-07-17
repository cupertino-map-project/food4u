import 'package:exercise3/models/food.dart';
import '../../models/user.dart';

abstract class UserService {
  Future<User> updateUser({User user});
  Future<User> getUserByID(dynamic userId);
  Future<Food> getFoodbyID({String foodId});
}
