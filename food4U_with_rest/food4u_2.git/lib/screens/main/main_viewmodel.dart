import 'package:exercise3/services/user/user_service.dart';

import '../../app/dependencies.dart';
import '../../services/counter/counter_service.dart';
import '../../models/user.dart';
import '../../models/counter.dart';
import '../user/user_viewmodel.dart';
import '../viewmodel.dart';

class MainViewmodel extends Viewmodel {
  UserService get _service => dependency();
  UserViewmodel get _userViewmodel => dependency();

  User get user => _userViewmodel.user;
  set user(User value) => update(() async => _userViewmodel.user = value);

  get currentName => user.name;
  set currentName(value) => user.name = value;

  get currentUsername => user.login;
  set currentUsername(value) => user.login = value;

  get currentPhoneNo => user.phoneNo;
  set currentPhoneNo(value) => user.phoneNo = value;

  get currentAddress => user.address;
  set currentAddress(value) => user.address = value;

  void _loadUser() =>
      update(() async => user = await _service.getUserByID(user.id));

  void authenticate(User user) =>
      update(() async => _userViewmodel.authenticate(user));

  Future<User> updateUser(String currentUsername, String currentName,
      String currentPhoneNo, String currentAddress) async {
    _loadUser();
    turnBusy();

    final User _user = await _service.updateUser(
        user: User(
            id: user.id,
            name: currentName,
            login: currentUsername,
            phoneNo: currentPhoneNo,
            address: currentAddress,
            password: user.password));
    turnIdle();
    return _user;
  }

  bool get isUserSignedIn => _userViewmodel.isUserSignedIn;
}
