import 'package:exercise3/screens/main/food_viewmodel.dart';
import 'package:exercise3/screens/main/profile/profile_viewmodel.dart';
import 'package:exercise3/screens/main/widgets/bar/unsigned_body.dart';
import 'package:flutter/material.dart';

import 'profile/profile.dart';
import 'widgets/bar/bar.dart';

import 'widgets/body.dart';
import '../view.dart';
import 'main_viewmodel.dart';

class MainScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (context) => MainScreen());

  @override
  _MainScreenState createState() => _MainScreenState();
}

int _selectedIndex = 0;

class _MainScreenState extends State<MainScreen> {
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: View(
          viewmodel: MainViewmodel(),
          builder: (_, mainViewmodel, __) {
            if (mainViewmodel.isUserSignedIn) {
              final _foodViewModel =
                  FoodViewModel(mainViewmodel: mainViewmodel);
              // final _profileViewModel =
              //     ProfileViewModel(mainViewmodel: mainViewmodel);
              List<Widget> _bottomBarOption = <Widget>[
                Container(child: Body(_foodViewModel)),
                Container(
                  child: Profile(mainViewmodel),
                ),
              ];
              return Scaffold(
                appBar: Bar(_foodViewModel),
                body: Container(
                  child: _bottomBarOption.elementAt(_selectedIndex),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.amber[800],
                  onTap: _onItemTapped,
                ),
                //floatingActionButton: Float(_counterViewmodel),
              );
            }

            return Scaffold(body: UnsignedInBody(mainViewmodel));
          },
        ),
      ),
    );
  }
}
