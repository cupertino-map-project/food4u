import '../../models/user.dart';

abstract class UserService {
  Future<User> updateUser({User user});
}
