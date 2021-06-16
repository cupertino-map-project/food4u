import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/user/user_viewmodel.dart';
import 'package:exercise3/screens/viewmodel.dart';
import 'package:exercise3/services/user/user_service.dart';

class ProfileViewModel extends Viewmodel {
  UserService get _service => dependency();
  UserViewmodel get _userViewmodel => dependency();

  final MainViewmodel _mainViewmodel;
  ProfileViewModel({mainViewmodel}) : _mainViewmodel = mainViewmodel {
    _loadUser();
  }
  User get user => _userViewmodel.user;
  set user(User value) => update(() async => _userViewmodel.user = value);

//form values;

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

  Future<User> updateUser(String currentUsername, String currentName,
      String currentPhoneNo, String currentAddress) async {
    turnBusy();
    final User _user = await _service.updateUser(
        user: User(
            name: currentName,
            login: currentUsername,
            phoneNo: currentPhoneNo,
            address: currentAddress));
    turnIdle();
    return _user;
  }
}
