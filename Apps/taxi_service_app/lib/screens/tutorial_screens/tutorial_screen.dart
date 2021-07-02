import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../theme.dart';
import '../auth_screens/signin_screen.dart';

// ignore: must_be_immutable
class TutorialScreen extends StatelessWidget {
  final PageController controller;
  final String imageUrl;
  final String title;
  final String buttonText;
  final int? pageIndex;

  const TutorialScreen({
    Key? key,
    required this.controller,
    required this.imageUrl,
    required this.title,
    required this.buttonText,
    this.pageIndex,
  }) : super(key: key);

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
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  TaxiServiceAppTheme.rectangle,
                  semanticLabel: 'rectangle',
                ),
                Image.asset(
                  imageUrl,
                  semanticLabel: imageUrl,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: mediaQuery.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                    'Huge delivery network. Helps you find comfortable, '
                    'safe and cheap ride.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5),
                FlatButton(
                  onPressed: () {
                    if (pageIndex != null) {
                      controller.animateToPage(pageIndex! + 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.routeName);
                    }
                  },
                  color: Colors.white,
                  child: Text(
                    buttonText,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
