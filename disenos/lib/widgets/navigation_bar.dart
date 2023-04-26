import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff373855),
      selectedItemColor: Color(0xffe180b1),
      unselectedItemColor: Color(0xff5e6081),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Graphic',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_front),
          label: 'User',
        ),
      ]
    );
  }
}