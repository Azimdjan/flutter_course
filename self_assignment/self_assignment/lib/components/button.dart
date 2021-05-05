import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String text;
  final IconData icon;
  Button({@required this.text,this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      child: SizedBox(
      width: 135,
      height: 50,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                  this.icon,
                  color: Colors.black,),
              SizedBox(width: 2,),
              Text(this.text,style: Theme.of(context).textTheme.headline3,)
            ],
          )
      ),
      ),
    );
  }
}