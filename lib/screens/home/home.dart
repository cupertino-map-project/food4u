import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:food4u/models/food.dart';
import 'package:food4u/screens/home/settings_form.dart';
import 'package:food4u/services/auth.dart';
import 'package:food4u/services/database.dart';
import 'package:provider/provider.dart';
import 'food_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // void _showSettingsPanel() {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (context) {
    //         return Container(
    //           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
    //           child: SettingsForm(),
    //         );
    //       });
    // }

    return StreamProvider<List<Food>>.value(
        value: DatabaseService().foods,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.blue[100],
          appBar: AppBar(
            title: Text('Find food near you',
                style: TextStyle(color: Colors.blue[800])),
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'),
              ),
              // ElevatedButton.icon(
              //   onPressed: () => _showSettingsPanel(),
              //   icon: Icon(Icons.settings),
              //   label: Text('settings'),
              // )
            ],
          ),
          body: Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage('assets/coffee_bg.png'),
              //   fit: BoxFit.cover,
              // )),
              child: FoodList()),
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
            selectedItemColor: Colors.amber[800],
          ),
        ));
  }
}
