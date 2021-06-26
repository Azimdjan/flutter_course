import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_service_app/screens/user_screens/history_screen.dart';
import 'package:taxi_service_app/screens/user_screens/settings_screen.dart';
import 'theme.dart';
import 'screens/auth_screens/signin_screen.dart';
import 'screens/auth_screens/sign_up_screen.dart';
import 'screens/user_screens/menu_screen.dart';
import 'screens/user_screens/search_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tutorial_screens/tutorial_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: TaxiServiceAppTheme.darkTheme(),
      routes: {
        '/': (ctx) => const SplashScreen(),
        TutorialPageView.routeName: (ctx) => const TutorialPageView(),
        SignInScreen.routeName: (ctx) => const SignInScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        SearchScreen.routeName: (ctx) => const SearchScreen(),
        MenuScreen.routeName: (ctx) => const MenuScreen(),
        SettingsScreen.routeName: (ctx) => SettingsScreen(),
        HistoryScreen.routeName: (ctx) => HistoryScreen(),
      },
    );
  }
}
