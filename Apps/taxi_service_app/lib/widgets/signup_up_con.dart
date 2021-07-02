import 'package:flutter/material.dart';
import '../models/form_validation.dart';
import 'password_field.dart';

class UpContainer extends StatefulWidget {
  UpContainer({Key? key}) : super(key: key);
  var _isConfirm = true;
  var _isName = true;
  var _isEmail = true;
  var _isPassword = true;
  var _isDisibled = true;

  @override
  _UpContainerState createState() => _UpContainerState();
}

class _UpContainerState extends State<UpContainer> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Create An Account',
              style: Theme.of(context).textTheme.headline3),
          const SizedBox(
            height: 15,
          ),
          Text('NAME', style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              isDisibled();
              node.nextFocus();
            },
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              errorText: widget._isName
                  ? null
                  : Validation.nameErrorText(nameController),
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
            height: 15,
          ),
          Text(
            'EMAIL ADDRESS',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            style: const TextStyle(color: Colors.white),
            onEditingComplete: () {
              isDisibled();
              node.nextFocus();
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              hintStyle: const TextStyle(color: Color(0xff545C9B)),
              errorText: widget._isEmail
                  ? null
                  : Validation.emailErrorText(emailController),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              fillColor: const Color(0xff311d64),
              filled: true,
              hintText: 'example@email.com',
              enabledBorder: const OutlineInputBorder(
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
          Text('ENTER NEW PASSWORD',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          PasswordField(
            hint: 'new password',
            passwordController: passwordController,
            isValid: widget._isPassword,
            function: isDisibled,
            node: node,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('CONFIRM PASSWORD',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          PasswordField(
            hint: 'confirm password',
            confirmController: confirmPasswordController,
            isValid: widget._isConfirm,
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
                onPressed: !widget._isDisibled
                    ? () {
                        setState(() {
                          print('hello');
                          widget._isName =
                              Validation.nameValidation(nameController);
                          widget._isEmail =
                              Validation.emailValidation(emailController);
                          widget._isPassword =
                              Validation.passwordValidation(passwordController);
                          widget._isConfirm = Validation.confirmValidation(
                              passwordController, confirmPasswordController);
                        });
                      }
                    : null,
                child: Text('SIGN UP',
                    style: Theme.of(context).textTheme.bodyText2)),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void isDisibled() {
    setState(() {
      if (confirmPasswordController.text.length != 0 &&
          passwordController.text.length != 0 &&
          nameController.text.length != 0 &&
          emailController.text.length != 0)
        widget._isDisibled = false;
      else
        widget._isDisibled = true;
    });
  }
}
