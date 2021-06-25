import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../widgets/signin_down_con.dart';
import '../../widgets/singin_up_con.dart';
import 'sign_up_screen.dart';
import '../user_screens/search_screen.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/signIn';

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(61, 41, 115, 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: UpContainer(),
                ),
              ),
              const DownContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
