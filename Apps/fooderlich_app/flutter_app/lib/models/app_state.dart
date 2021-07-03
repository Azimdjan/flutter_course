import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_cache.dart';

class FooderlichTab {
  static const exposes = 0;
  static const recipes = 1;
  static const toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onBoardingComplete = false;
  int _selectedTab = FooderlichTab.exposes;
  final _appCache = AppCache();

  bool get initialized => _initialized;

  bool get loggedIn => _loggedIn;

  bool get onBoardingComplete => _onBoardingComplete;

  int get selectedTab => _selectedTab;

  void initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onBoardingComplete = await _appCache.didCompleteOnboarding();
    Timer(Duration(seconds: 2), () {
      _initialized = true;
      print(_initialized);
      notifyListeners();
    });
  }

  void login(String userName, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void completeOnBoarding() async {
    _onBoardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(int index){
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  void logout() async {
    _loggedIn = false;
    _onBoardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    await _appCache.invalidate();
    initializeApp();
    notifyListeners();
  }
}
