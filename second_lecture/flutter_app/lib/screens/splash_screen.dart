import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      child: const SplashScreen(),
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
    );
  }

  const SplashScreen({Key key}):super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context,listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              height: 200,
              image: AssetImage('assets/fooderlich_assets/rw_logo.png'),
            ),
            const Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
