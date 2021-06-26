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
            Text(
              'CREATE AN ACCOUNT?',
              style: Theme.of(context).textTheme.bodyText2,
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
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'OR',
              style: Theme.of(context).textTheme.bodyText2,
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
                    Text(
                      'f',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sign Up With Facebook',
                      style: Theme.of(context).textTheme.bodyText1,
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
                    Text(
                      'G',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 1,
                      height: double.infinity,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sign Up With Google',
                      style: Theme.of(context).textTheme.bodyText1,
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
