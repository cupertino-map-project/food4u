import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/viewmodel.dart';
import 'package:exercise3/services/auth/auth_service.dart';

class RegisterViewModel extends Viewmodel {
  AuthService get _service => dependency();

  User _user = User();

  get user => _user;
  set user(value) => _user = value;

  get username => _user.login;
  set username(value) {
    turnBusy();
    _user.login = value;
    turnIdle();
  }

  get name => _user.name;
  set name(value) {
    turnBusy();
    _user.name = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _user.password = value;
    turnIdle();
  }

  get phoneNo => _user.phoneNo;
  set phoneNo(value) {
    turnBusy();
    _user.phoneNo = value;
    turnIdle();
  }

  get address => _user.address;
  set address(value) {
    turnBusy();
    _user.address = value;
    turnIdle();
  }

  Future<User> register() async {
    turnBusy();
    final User _user = await _service.register(
        user: new User(
      name: name,
      login: username,
      photoUrl: '',
      password: password,
      phoneNo: phoneNo,
      address: address,
      roles: "buyer",
    ));
    turnIdle();
    return _user;
  }
}
