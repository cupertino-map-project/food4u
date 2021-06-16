import 'package:exercise3/shared/pallete.dart';
import 'package:flutter/material.dart';
import '../../main_viewmodel.dart';

class UnsignedInBody extends StatelessWidget {
  final MainViewmodel _viewmodel;
  const UnsignedInBody(viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Flexible(
              child: Center(
                child: Text(
                  'Food4U',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBlue,
              ),
              child: TextButton(
                onPressed: () => _onPressLoginButton(context),
                child: Text(
                  'Login',
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kBlue,
              ),
              child: TextButton(
                onPressed: () => _onPressRegisterButton(context),
                child: Text(
                  'Register',
                  style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  // return Scaffold(
  //     body: Container(
  //   child: Center(
  //     child: Column(
  //       children: <Widget>[
  //         SizedBox(height: 50.0),
  //         //REGISTER
  //         ElevatedButton.icon(
  //           style: ButtonStyle(
  //               backgroundColor:
  //                   MaterialStateProperty.all<Color>(Colors.blue[800])),
  //           onPressed: () => _onPressLoginButton(context),
  //           icon: Icon(Icons.person),
  //           label: Text('LOGIN'),
  //         ),
  //         SizedBox(height: 20.0),
  //         //REGISTER
  //         ElevatedButton.icon(
  //           style: ButtonStyle(
  //               backgroundColor:
  //                   MaterialStateProperty.all<Color>(Colors.blue[800])),
  //           onPressed: () => _onPressRegisterButton(context),
  //           icon: Icon(Icons.person),
  //           label: Text('Register'),
  //         )
  //       ],
  //     ),
  //   ),
  // ));
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
