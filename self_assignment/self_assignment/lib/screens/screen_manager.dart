import 'dart:collection';
import 'package:flutter/material.dart';

import 'screens.dart';


class ScreenManager extends ChangeNotifier{
  int _currentIndex = 2;

  get currentIndex => _currentIndex;
  set setCurrentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

  static List<Widget> screens = [
    SearchScreen(),
    CalendarScreen(),
    HomeScreen(),
  ];
}