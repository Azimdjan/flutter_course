import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'search_screen.dart';
import '../../layouts/with_out_appbar.dart';
import '../../theme.dart';

class ConfirmationScreen extends StatefulWidget {
  static const routeName = '/confirmation';

  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithOutAppBar(child: buildScreen(context));
  }

  Widget buildScreen(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TaxiServiceAppTheme.confirmationImage,
            ),
            const SizedBox(height: 25),
            Text(
              'Thank You',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            Text(
              'For Your Confirmation',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
