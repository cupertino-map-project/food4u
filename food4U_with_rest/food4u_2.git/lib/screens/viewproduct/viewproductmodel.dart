import 'package:exercise3/app/dependencies.dart';
import 'package:exercise3/models/cart.dart';
import 'package:exercise3/models/food.dart';
import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/user/user_viewmodel.dart';
import 'package:exercise3/screens/viewmodel.dart';
import 'package:exercise3/services/user/user_service.dart';

class ViewProductModel extends Viewmodel {
  UserService get _service => dependency();
  // UserViewmodel get _userViewmodel => dependency();

  User _user = User();
  get user => _user;
  // set user(User value) => update(() async => _userViewmodel.user = value);
  void setUser(User value) {
    this._user = value;
  }

  Food _data;
  get data => _data;

  get cart => _user.cart;
  set cart(value) {
    _user.cart = value;
  }

  // int _numOfItem = 1;
  // get numOfItem => _numOfItem;
  // set numOfItem(value) => numOfItem = value;

  // int _numOfItem;
  // get numOfItem => _numOfItem;
  // set numOfItem(value) => numOfItem = value;

  get cartList => user.cartList;

  Future<User> updateUser(User user) async {
    turnBusy();
    final User updatedUser = await _service.updateUser(user: user);
    return updatedUser;
  }
}
