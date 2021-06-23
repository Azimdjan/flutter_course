import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../login_screens/signin_screen.dart';

class TutorialScreen3 extends StatelessWidget {
  final PageController controller;

  const TutorialScreen3({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInScreen.routeName);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Color(0xff343B71)),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/Rectangle.png',
                  semanticLabel: 'rectangle',
                ),
                Image.asset(
                  'assets/images/image3.png',
                  semanticLabel: 'icon',
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: mediaQuery.height * 0.35,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Color(0xff343B71),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Track Your Ride',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF-Pro-Display',
                      fontSize: 28,
                      color: Colors.white),
                ),
                const Text(
                  'Huge delivery network. '
                  'Helps you find comfortable, safe and cheap ride.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7177AB)),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignInScreen.routeName);
                  },
                  color: Colors.white,
                  child: const Text(
                    'Let\'s Start',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff343B71)),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(),
                  onDotClicked: (index) => controller.animateToPage(index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
