import 'package:exercise3/screens/main/profile/profile_viewmodel.dart';
import 'package:exercise3/services/user/user_service_rest.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:flutter/material.dart';

import '../main_viewmodel.dart';

class EditProfileForm extends StatefulWidget {
  final ProfileViewModel _viewmodel;
  EditProfileForm(ProfileViewModel viewmodel) : _viewmodel = viewmodel;

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Update your Profile Setting',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            //Name
            TextFormField(
              initialValue: widget._viewmodel.user.login,
              decoration: inputDecoration,
              validator: (value) =>
                  value.isEmpty ? 'Please enter a Username' : null,
              onChanged: (value) =>
                  setState(() => widget._viewmodel.currentUsername = value),
            ),
            SizedBox(height: 10.0),
            //Email
            TextFormField(
              initialValue: widget._viewmodel.user.name,
              decoration: inputDecoration,
              validator: (value) =>
                  value.isEmpty ? 'Please enter a name' : null,
              onChanged: (value) =>
                  setState(() => widget._viewmodel.currentName = value),
            ),
            SizedBox(height: 10.0),
            //PhoneNo
            TextFormField(
              initialValue: widget._viewmodel.user.phoneNo,
              decoration: inputDecoration,
              validator: (value) =>
                  value.isEmpty ? 'Please enter a Phone No' : null,
              onChanged: (value) =>
                  setState(() => widget._viewmodel.currentPhoneNo = value),
            ),
            SizedBox(height: 10.0),
            //Address
            TextFormField(
              initialValue: widget._viewmodel.user.address,
              decoration: inputDecoration,
              validator: (value) =>
                  value.isEmpty ? 'Please enter Address' : null,
              onChanged: (value) =>
                  setState(() => widget._viewmodel.currentAddress = value),
            ),
            SizedBox(height: 10.0),

            //Button - update profile data
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[400])),
              child: Text('Update', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await widget._viewmodel.updateUser(
                    widget._viewmodel.currentName ??
                        widget._viewmodel.user.name,
                    widget._viewmodel.currentUsername ??
                        widget._viewmodel.user.login,
                    widget._viewmodel.currentPhoneNo ??
                        widget._viewmodel.user.phoneNo,
                    widget._viewmodel.currentAddress ??
                        widget._viewmodel.user.address,
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
