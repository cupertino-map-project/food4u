import 'package:flutter/material.dart';
import '../../main_viewmodel.dart';

class UnsignedInBody extends StatelessWidget {
  final MainViewmodel _viewmodel;
  const UnsignedInBody(viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            //REGISTER
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[800])),
              onPressed: () => _onPressLoginButton(context),
              icon: Icon(Icons.person),
              label: Text('LOGIN'),
            ),
            SizedBox(height: 20.0),
            //REGISTER
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[800])),
              onPressed: () => _onPressRegisterButton(context),
              icon: Icon(Icons.person),
              label: Text('Register'),
            )
          ],
        ),
      ),
    ));
  }

  void _onPressLoginButton(context) async {
    final _user = await Navigator.pushNamed(context, '/login');

    if (_user != null) {
      _viewmodel.user = _user;
    }
  }

  void _onPressRegisterButton(context) async {
    final _user = await Navigator.pushNamed(context, '/register');

    if (_user != null) {
      _viewmodel.user = _user;
    }
  }
}
