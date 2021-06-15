import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  int _selectedIndex;
  Bottom(int selectedIndex) : _selectedIndex = selectedIndex;

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  void _onItemTapped(int index) {
    setState(() => widget._selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: widget._selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
