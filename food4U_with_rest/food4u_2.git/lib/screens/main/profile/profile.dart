import 'package:exercise3/models/user.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:exercise3/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";
  final MainViewmodel _viewmodel;
  Profile(MainViewmodel viewmodel) : _viewmodel = viewmodel;

  @override
  _ProfileState createState() => _ProfileState(_viewmodel);
}

class _ProfileState extends State<Profile> {
  final MainViewmodel _viewmodel;
  _ProfileState(MainViewmodel viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
            child: Column(
          children: [
            //for circle avatar image
            _getHeader(),
            SizedBox(
              height: 5,
            ),
            _profileName("${_viewmodel.user.name}"),
            SizedBox(
              height: 14,
            ),
            _heading("Personal Details"),
            SizedBox(
              height: 6,
            ),
            _detailsCard(_viewmodel.user),
            SizedBox(
              height: 10,
            ),
            _heading("Settings"),
            SizedBox(
              height: 6,
            ),
            _settingsCard(),
            Spacer(),
            logoutButton()
          ],
        )),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/images/default.png')), // color: Colors.orange[100],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard(User userData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.person),
              title: Text("${userData.login}"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("${userData.phoneNo}"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("${userData.address}"),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    void _showEditProfilePanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditProfileForm(_viewmodel),
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => _showEditProfilePanel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () => _viewmodel.user = null,
      child: Container(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
