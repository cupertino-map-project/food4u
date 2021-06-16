import '../../models/user.dart';

abstract class UserService {
  Future<User> updateUser({User user});
  Future<User> getUserByID(dynamic userId);
}
