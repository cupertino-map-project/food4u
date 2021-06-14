import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/register/register_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _onRegister(BuildContext context, RegisterViewModel viewmodel) async {
    final User _user = await viewmodel.register();

    if (_user != null) Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: RegisterViewModel(),
      builder: (context, viewmodel, _) => Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/Food4U.png', scale: 1.5),

                  SizedBox(height: 10.0),

                  //______________USERNAME_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Username'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a name' : null,
                      onChanged: (value) => viewmodel.username = value),
                  SizedBox(height: 10.0),
                  //______________PASSWORD_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Password'),
                      validator: (value) => value.length < 6
                          ? 'Password must be 6 characters long'
                          : null,
                      obscureText: true,
                      onChanged: (value) => viewmodel.password = value),
                  SizedBox(height: 10.0),
                  //______________NAME_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(hintText: 'Name'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a name' : null,
                      onChanged: (value) => viewmodel.name = value),
                  SizedBox(height: 10.0),
                  //______________Phone No_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Phone No'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a Phone No' : null,
                      onChanged: (value) => viewmodel.phoneNo = value),
                  SizedBox(height: 10.0),
                  //______________ADDRESS_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(hintText: 'Address'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter Address' : null,
                      onChanged: (value) => viewmodel.address = value),
                  SizedBox(height: 10.0),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _onRegister(context, viewmodel)),
                  SizedBox(height: 12.0),
                  Text('Invalid information',
                      style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            ),
          )),
    );
  }
}