import 'dart:async';

import 'package:flutter/material.dart';
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
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xff343B71),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: mediaQuery.height * 0.1121,
              decoration: const BoxDecoration(
                color: Color(0xff3A4178),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/icons/triangle.png',
                  semanticLabel: 'triangle icon',
                ),
                const Center(
                  child: Text(
                    'Alaska',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: mediaQuery.height * 0.1121,
              decoration: const BoxDecoration(
                color: Color(0xff3A4178),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
