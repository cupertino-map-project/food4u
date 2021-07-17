import 'package:exercise3/models/food.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../view.dart';
import '../login_viewmodel.dart';

class Body extends StatelessWidget {
  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();
    final List<Food> food = await viewmodel.getFood(foodID: _user.cart);
    if (_user != null) Navigator.pop(context, _user);
    if (food != null) {
      for (int i = 0; i < food.length; i++) {
        _user.setCartList(value: food[i]);
        print("dah jadi print food" + _user.cartList[i].name);
      }
    }
  }

  void _onCancel(BuildContext context, LoginViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      builder: (context, viewmodel, _) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/Food4U.png',
                scale: 1.5,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: inputDecoration.copyWith(hintText: 'Username'),
                  validator: (value) =>
                      value.isEmpty ? 'Enter a username' : null,
                  onChanged: (value) => viewmodel.username = value),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: inputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) => value.length < 6
                      ? 'Password must be 6 characters long'
                      : null,
                  obscureText: true,
                  onChanged: (value) => viewmodel.password = value),
              SizedBox(height: 20.0),
              _buildButtons(context, viewmodel),
              SizedBox(height: 12.0),
              if (viewmodel.showErrorMessage)
                Text('Invalid Username or pssword!',
                    style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );

    // return View(
    //   viewmodel: LoginViewmodel(),
    //   builder: (context, viewmodel, _) => Column(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       _buildTextField(
    //           hint: 'Username',
    //           icon: Icons.people,
    //           onChanged: (value) => viewmodel.username = value),
    //       _buildTextField(
    //           hint: 'Password',
    //           isObsecure: !viewmodel.showPassword,
    //           icon: Icons.lock,
    //           button: IconButton(
    //               icon: Icon(Icons.visibility),
    //               onPressed: () =>
    //                   viewmodel.showPassword = !viewmodel.showPassword),
    //           onChanged: (value) => viewmodel.password = value),
    //       if (viewmodel.showErrorMessage)
    //         Text(
    //           'Invalid username or password!',
    //           style: TextStyle(color: Colors.red, fontSize: 20.0),
    //         ),
    //       SizedBox(height: 10.0),
    //       _buildButtons(context, viewmodel)
    //     ],
    //   ),
    // );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context, LoginViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Log in'),
          onPressed: () => _onLogin(context, viewmodel),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => _onCancel(context, viewmodel),
        ),
      ],
    );
  }
}
