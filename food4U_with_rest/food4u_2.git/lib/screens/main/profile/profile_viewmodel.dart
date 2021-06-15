import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/user/user_viewmodel.dart';
import 'package:exercise3/screens/viewmodel.dart';
import 'package:exercise3/services/user/user_service.dart';

class ProfileViewModel extends Viewmodel {
  UserService get _service => dependency();

  final MainViewmodel _mainViewmodel;
  ProfileViewModel({mainViewmodel}) : _mainViewmodel = mainViewmodel;

//form values;

  User get user => _mainViewmodel.user;
  set user(User value) => update(() async => _mainViewmodel.user = value);

  get currentName => _mainViewmodel.user.name;
  set currentName(value) => _mainViewmodel.user.name = value;

  get currentUsername => _mainViewmodel.user.login;
  set currentUsername(value) => _mainViewmodel.user.login = value;

  get currentPhoneNo => _mainViewmodel.user.phoneNo;
  set currentPhoneNo(value) => _mainViewmodel.user.phoneNo = value;

  get currentAddress => _mainViewmodel.user.address;
  set currentAddress(value) => _mainViewmodel.user.address = value;

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
