import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_controller/components/Checking.dart';
import 'package:text_controller/components/LoginButton.dart';

class InputTextField extends StatefulWidget{
  final String hint;
  final bool isPassword;
  static bool isButton = true;
  InputTextField({this.hint,this.isPassword=false,});

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState(){
    if(controller.text.trim()=="" || controller.text.trim().isEmpty){
      InputTextField.isButton = true;
    }
    else {
      InputTextField.isButton = false;
    }
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: (text){

      },
      controller: controller,
      padding: EdgeInsets.all(16),
      obscureText: widget.isPassword,
      style: TextStyle(
        color: Color(0xff262626),
        fontSize: 24,
        fontWeight: FontWeight.normal,
        fontFamily: 'SF Pro Text'
      ),
      placeholder: widget.hint,
      placeholderStyle: TextStyle(
        color: Colors.grey,
        fontSize: 24,
        fontWeight: FontWeight.normal,
        fontFamily: 'SF Pro Text'
      ),
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff000000).withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            offset: Offset(0,4),
            blurRadius: 12
          )
        ]
      ),
    );
  }
}