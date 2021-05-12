import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_controller/components/Checking.dart';
import 'package:text_controller/components/text_editor_controller.dart';

class LoginButton extends StatefulWidget{
  // get isDisabled => _isDisabled;
  // set setIsDisabled(bool check){
  //   _isDisabled = check;
  // }
  static bool isDisabled = true;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Function disable(){
      setState(() {
        if(InputTextField.isButton)
          LoginButton.isDisabled = true;
        else
          LoginButton.isDisabled = false;
      });
  }

  Function login(){}

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: double.infinity, height: 50),
      child: RaisedButton(
      color: Colors.blue,
      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      disabledColor: Colors.blue.withOpacity(0.4),
      onPressed: LoginButton.isDisabled ? null : login,
    ),
    );
  }
}