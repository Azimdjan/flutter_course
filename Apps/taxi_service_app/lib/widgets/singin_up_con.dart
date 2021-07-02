import 'package:flutter/material.dart';
import '../models/form_validation.dart';
import 'password_field.dart';
import '../screens/user_screens/search_screen.dart';

class UpContainer extends StatefulWidget {
  UpContainer({Key? key}) : super(key: key);

  @override
  _UpContainerState createState() => _UpContainerState();
}

class _UpContainerState extends State<UpContainer> {
  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  var _isPassword = true;

  var _isDisibled = true;

  var _isName = true;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
          TextField(
            controller: nameController,
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.next,
            onEditingComplete: (){
              node.nextFocus();
              isDisibled();
            },
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              errorText:
                  _isName ? null : Validation.nameErrorText(nameController),
              hintStyle: const TextStyle(color: Color(0xff545C9B)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              fillColor: const Color(0xff311d64),
              filled: true,
              hintText: 'Otajonov Azim',
              enabledBorder: const OutlineInputBorder(
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
          PasswordField(
            hint: 'password',
            passwordController: passwordController,
            isValid: _isPassword,
            function: isDisibled,
            node: node,
          ),
          const SizedBox(
            height: 25,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: mediaQuery.height * 0.08,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, onSurface: Colors.white),
              onPressed:!_isDisibled ? () {
                Navigator.of(context)
                    .pushReplacementNamed(SearchScreen.routeName);
              } : null,
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff343B71),
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void isDisibled() {
    setState(() {
      if (passwordController.text.length != 0 &&
          nameController.text.length != 0)
        _isDisibled = false;
      else
        _isDisibled = true;
    });
  }
}
