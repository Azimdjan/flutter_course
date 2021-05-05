import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget{
  const NavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search,size: 30),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today,size: 30),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30),
              label: "")
        ],
      );
  }

}