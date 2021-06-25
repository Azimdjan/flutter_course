import 'package:flutter/material.dart';
import 'package:taxi_service_app/widgets/password_field.dart';
import '../screens/user_screens/search_screen.dart';

class UpContainer extends StatefulWidget {
  const UpContainer({Key? key}) : super(key: key);

  @override
  _UpContainerState createState() => _UpContainerState();
}

class _UpContainerState extends State<UpContainer> {
  var _isVisible = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Let\'s Get Started',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'NAME',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const TextField(
            controller: null,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff545C9B)),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
              fillColor: Color(0xff282F62),
              filled: true,
              hintText: 'Otajonov Azim',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff545C9B),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'PASSWORD',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const PasswordField(hint: 'password'),
          const SizedBox(
            height: 25,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.08,
            child: MaterialButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      SearchScreen.routeName);
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff343B71),
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
