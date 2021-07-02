import 'package:flutter/material.dart';
import '../screens/auth_screens/signin_screen.dart';

class DownContainer extends StatelessWidget {
  const DownContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mediaQuery.height * 0.2,
      decoration: const BoxDecoration(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'ALREADY HAVE AN ACCOUNT?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'SF-Pro-Display',
                fontSize: 14,
                color: Color.fromRGBO(61, 41, 115, 1.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: mediaQuery.height * 0.08,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffB9BCDD)),
              ),
              child: MaterialButton(
                elevation: 0,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInScreen.routeName);
                },
                color: Colors.white,
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
