import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/services/user/user_service.dart';
import '../rest.dart';

class UserServiceRest implements UserService {
  RestService get rest => dependency();

  Future<User> updateUser({User user}) async {
    final json = await rest.put('users/${user.id}', data: user);
    return User.fromJson(json);
  }
}
