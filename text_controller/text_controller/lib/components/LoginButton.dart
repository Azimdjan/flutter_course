import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_controller/components/Checking.dart';

class LoginButton extends StatelessWidget{
  // get isDisabled => _isDisabled;
  // set setIsDisabled(bool check){
  //   _isDisabled = check;
  // }
  Function disable(){
    if(Checking.isDisabled)
      return null;
    else
      return login;
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
      onPressed: disable(),
    ),
    );
  }
}