import 'package:flutter/material.dart';
import 'package:taxi_service_app/widgets/password_field.dart';

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
            height: 20,
          ),
          const Text(
            'Create An Account',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 15,
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
            height: 10,
          ),
          const TextField(
            controller: null,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff545C9B)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            height: 15,
          ),
          const Text(
            'EMAIL ADDRESS',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            controller: null,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xff545C9B)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              fillColor: Color(0xff282F62),
              filled: true,
              hintText: 'example@email.com',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff545C9B),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'ENTER NEW PASSWORD',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const PasswordField(hint: 'new password'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'CONFIRM PASSWORD',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Pro-Display',
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const PasswordField(hint: 'confirm password'),
          const SizedBox(
            height: 25,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.08,
            child: MaterialButton(
                color: Colors.white,
                onPressed: () {},
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(61, 41, 115, 1.0),
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
