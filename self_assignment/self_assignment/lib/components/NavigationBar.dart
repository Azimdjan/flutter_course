import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_assignment/screens/screen_manager.dart';

class NavigationBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenManager>(
      builder: (context,navi,child)=>
          BottomNavigationBar(
        currentIndex: navi.currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index){
          navi.setCurrentIndex = index;
        },
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
      ),
    );
  }

}