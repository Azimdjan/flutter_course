import 'dart:async';
import 'package:flutter/material.dart';
import '../layouts/with_out_appbar.dart';
import '../theme.dart';
import 'tutorial_screens/tutorial_page_view.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(TutorialPageView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithOutAppBar(
      child: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.1121,
            decoration: BoxDecoration(
              color: theme.accentColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          Column(
            children: [
              Image.asset(
                TaxiServiceAppTheme.triangleIcon,
                semanticLabel: 'triangle icon',
              ),
              Center(
                child: Text(
                  'Alaska',
                  style: theme.textTheme.headline4,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.1121,
            decoration: BoxDecoration(
              color: theme.accentColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
