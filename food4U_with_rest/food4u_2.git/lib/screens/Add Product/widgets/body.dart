import 'package:exercise3/models/food.dart';
import 'package:exercise3/screens/Add%20Product/addProduct_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:exercise3/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProductBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _onAddFood(BuildContext context, AddProductViewModel viewmodel) async {
    final Food _food = await viewmodel.addFood();
    if (_food != null) Navigator.pop(context, _food);
  }

  void _onCancel(BuildContext context, AddProductViewModel viewmodel) {
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
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
                      onChanged: (value) => viewmodel.name = value),
                  SizedBox(height: 10.0),
                  //______________ownerName_____________
                  TextFormField(
                      decoration:
                          inputDecoration.copyWith(hintText: 'Owner Name'),
                      validator: (value) => value.isEmpty
                          ? 'Enter owner name for the food'
                          : null,
                      onChanged: (value) => viewmodel.ownerName = value),
                  SizedBox(height: 10.0),
                  //______________Food decription_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(
                          hintText: 'Food Description'),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a description' : null,
                      onChanged: (value) => viewmodel.name = value),
                  SizedBox(height: 10.0),
                  //______________Price_____________
                  TextFormField(
                      decoration: inputDecoration.copyWith(hintText: 'Price'),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) =>
                          value.isEmpty ? 'Enter Price' : null,
                      onChanged: (value) =>
                          viewmodel.price = double.parse(value)),
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

  Row _buildButtons(BuildContext context, AddProductViewModel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Register'),
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
