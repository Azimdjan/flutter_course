import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:flutter_app/models/grocery_manager.dart';
import 'package:flutter_app/models/profile_manager.dart';
import 'package:flutter_app/navigation/app_link.dart';
import 'package:flutter_app/screens/grocery_item_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/onboarding_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'package:flutter_app/screens/webview_screen.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({
    this.appStateManager,
    this.groceryManager,
    this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.initialized) SplashScreen.page(),
        if (appStateManager.initialized &&
            !appStateManager.loggedIn)
          LoginScreen.page(),
        if(!appStateManager.onBoardingComplete && appStateManager.loggedIn)
          OnBoardingScreen.page(),
        if(appStateManager.onBoardingComplete)
          Home.page(appStateManager.selectedTab),
        if(groceryManager.isCreateNewItem)
          GroceryItemScreen.page(
            onCreate: (item){
              groceryManager.addItem(item);
            },
          ),
        if(groceryManager.selectedIndex != null)
          GroceryItemScreen.page(
            item: groceryManager.selectedGroceryItem,
            index: groceryManager.selectedIndex,
            onUpdate: (item,index){
              groceryManager.updateItem(index, item);
            }
          ),
        if(profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if(profileManager.didTapOnRaywenderlich)
          WebViewScreen.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;
    if(route.settings.name == FooderlichPages.onBoardingPath)
      appStateManager.logout();
    if(route.settings.name == FooderlichPages.groceryItemDetails)
      groceryManager.groceryItemTapped(null);
    if(route.settings.name == FooderlichPages.profilePath)
      profileManager.tapOnProfile(false);
    if(route.settings.name == FooderlichPages.raywenderlich)
      profileManager.tapOnRaywenderlich(false);
    return true;
  }

  AppLink getCurrentPath(){
    if(!appStateManager.loggedIn)
      return AppLink(location: AppLink.kLoginPath);
    else if(!appStateManager.onBoardingComplete)
      return AppLink(location: AppLink.kOnboardingPath);
    else if(profileManager.didSelectUser)
      return AppLink(location: AppLink.kProfilePath);
    else if(groceryManager.isCreateNewItem)
      return AppLink(location: AppLink.kItemPath);
    else if(groceryManager.selectedGroceryItem!=null){
      final id = groceryManager.selectedGroceryItem.id;
      return AppLink(location: AppLink.kItemPath,itemId: id);
    }
    else{
      return AppLink(
        location: AppLink.kHomePath,
        currentTab: appStateManager.selectedTab
      );
    }
  }

  AppLink get currentConfiguration => getCurrentPath();

  @override
  Future<void> setNewRoutePath(AppLink newLink) async {
    switch(newLink.location){
      case AppLink.kProfilePath:
        profileManager.tapOnProfile(true);
        break;
      case AppLink.kItemPath:
        if(newLink.itemId!=null){
          groceryManager.setSelectedGroceryItem(newLink.itemId);
        }else{
          groceryManager.createNewItem();
        }
        profileManager.tapOnProfile(false);
        break;
      case AppLink.kHomePath:
        appStateManager.goToTab(newLink.currentTab ?? 0);
        profileManager.tapOnProfile(false);
        groceryManager.groceryItemTapped(null);
        break;
      default:
        break;
    }
  }
}
