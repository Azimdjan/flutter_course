import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_assignment/screens/screen_manager.dart';
import 'home.dart';
import 'package:self_assignment/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ramble',
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child){
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: data.textScaleFactor*1,
          ),
          child: child,
        );
      },
      theme: AppTheme.lightTheme(),
      home: ChangeNotifierProvider<ScreenManager>(
        create: (context) => ScreenManager(),
        child: MyHomePage(),
      ),
    );
  }
}