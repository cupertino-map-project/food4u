import 'dart:io';

import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/register/register_viewmodel.dart';
import 'package:exercise3/screens/register/widgets/button_widget.dart';
import 'package:exercise3/screens/register/widgets/firebase_api.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();

  void _onRegister(BuildContext context, RegisterViewModel viewmodel) async {
    final User _user = await viewmodel.register();
    print(_user.id);
    if (_user != null) Navigator.pop(context, _user);
  }

  void _onCancel(BuildContext context, RegisterViewModel viewmodel) {
    Navigator.pop(context, null);
  }

  UploadTask task;

  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
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
                  //______________Profile Picture_______
                  ButtonWidget(
                    text: 'Select File',
                    icon: Icons.attach_file,
                    onClicked: selectFile,
                  ),
                  SizedBox(height: 8),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  //_________Upload Button___________
                  SizedBox(height: 28),
                  ButtonWidget(
                    text: 'Upload File',
                    icon: Icons.cloud_upload_outlined,
                    onClicked: uploadFile,
                  ),
                  SizedBox(height: 20),
                  task != null ? buildUploadStatus(task) : Container(),
                  SizedBox(height: 10.0),
                  _buildButtons(context, viewmodel),
                  SizedBox(height: 12.0),
                  Text('Invalid information',
                      style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            ),
          )),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  Row _buildButtons(BuildContext context, RegisterViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Register'),
          onPressed: () => _onRegister(context, viewmodel),
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
