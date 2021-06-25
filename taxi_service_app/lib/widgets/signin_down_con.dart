import 'package:flutter/material.dart';
import '../screens/auth_screens/sign_up_screen.dart';

class DownContainer extends StatelessWidget {
  const DownContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mediaQuery.height * 0.4,
      decoration: const BoxDecoration(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'CREATE AN ACCOUNT?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'SF-Pro-Display',
                fontSize: 14,
                color: Color(0xff343B71),
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
                      .pushReplacementNamed(SignUpScreen.routeName);
                },
                color: Colors.white,
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff343B71)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'OR',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff343B71)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: mediaQuery.width * 0.6,
              height: mediaQuery.height * 0.06,
              decoration: const BoxDecoration(
                color: Color(0xff536396),
              ),
              child: FlatButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 13, vertical: 8),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'f',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Sign Up With Facebook',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: mediaQuery.width * 0.6,
              height: mediaQuery.height * 0.06,
              decoration: const BoxDecoration(
                color: Color(0xffF47070),
              ),
              child: FlatButton(
                padding: const EdgeInsets.symmetric(
                    horizontal: 13, vertical: 8),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'G',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 19,
                    ),
                    Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Sign Up With Google',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SF-Pro-Display',
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
