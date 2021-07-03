import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_route_parser.dart';
import 'package:flutter_app/screens/welcome_screen.dart';
import 'fooderlich_theme.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'models/models.dart';
import 'home.dart';
import 'package:flutter_app/router.dart';
import 'package:flutter_app/constant/rout.dart';

import 'models/profile_manager.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatefulWidget {
  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final AppStateManager _appStateManager = AppStateManager();
  final GroceryManager _groceryManager = GroceryManager();
  final ProfileManager _profileManager = ProfileManager();
  AppRouter _appRouter;
  final routeParser = AppRouteParser();
  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var darkTheme = FooderlichTheme.dark();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>_appStateManager),
        ChangeNotifierProvider(create: (ctx)=>_groceryManager),
        ChangeNotifierProvider(create: (ctx)=>_profileManager),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        // onGenerateRoute: Rout.generateRoute,
        // initialRoute: page,
        routeInformationParser: routeParser,
        routerDelegate: _appRouter,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}