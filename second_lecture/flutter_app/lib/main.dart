import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'home.dart';

void main() {
  runApp(Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var darkTheme = FooderlichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>TabManager()),
          ChangeNotifierProvider(create: (context)=>GroceryManager()),
        ],
        child: Home(),
      ),
    );
  }
}