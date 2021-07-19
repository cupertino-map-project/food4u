import 'dart:io';

import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/Add%20Product/addProduct_viewmodel.dart';
import 'package:exercise3/screens/register/widgets/button_widget.dart';
import 'package:exercise3/screens/register/widgets/firebase_api.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class AddProductBody extends StatefulWidget {
  final AddProductViewModel _viewmodel;
  const AddProductBody(AddProductViewModel viewmodel) : _viewmodel = viewmodel;
  @override
  _AddProductBodyState createState() => _AddProductBodyState(_viewmodel);
}

class _AddProductBodyState extends State<AddProductBody> {
  final AddProductViewModel _viewmodel;
  final _formKey = GlobalKey<FormState>();

  _AddProductBodyState(AddProductViewModel viewModel) : _viewmodel = viewModel;

  void _onAddFood(BuildContext context, AddProductViewModel viewmodel) async {
    onAddProduct(viewmodel);
    Navigator.pop(context);
  }

  void onAddProduct(AddProductViewModel viewModel) async {
    final Food _food = await viewModel.addFood();
    viewModel.setFood(_food);
  }

  void _onCancel(BuildContext context, AddProductViewModel viewmodel) {
    Navigator.pop(context, null);
  }

  UploadTask task;

  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
    return View(
      viewmodel: AddProductViewModel(),
      builder: (context, viewmodel, _) => Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/Food4U.png', scale: 1.5),

                  SizedBox(height: 10.0),

                  //______________NAME_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Food Name'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a name' : null,
                      onChanged: (value) => _viewmodel.name = value),
                  SizedBox(height: 10.0),
                  //______________ownerName_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Owner Name'),
                      validator: (value) => value.isEmpty
                          ? 'Enter owner name for the food'
                          : null,
                      onChanged: (value) => _viewmodel.ownerName = value),
                  SizedBox(height: 10.0),
                  //______________Food decription_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(
                          hintText: 'Food Description'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a description' : null,
                      onChanged: (value) => _viewmodel.description = value),
                  SizedBox(height: 10.0),
                  //______________Price_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(hintText: 'Price'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                      validator: (value) =>
                          value.isEmpty ? 'Enter Price' : null,
                      onChanged: (value) => _viewmodel.price = value),
                  SizedBox(height: 10.0),

                  //______________Product Picture_______
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
                  _buildButtons(context, _viewmodel),
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
    _viewmodel.setPhotoUrl(urlDownload);
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

  Row _buildButtons(BuildContext context, AddProductViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Register Product'),
          onPressed: () => _onAddFood(context, viewmodel),
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
