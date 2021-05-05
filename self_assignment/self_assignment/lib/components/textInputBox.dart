import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget{
  const TextInputBox();

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
        elevation: 10,
        child: Container(
          constraints: BoxConstraints.expand(width: double.infinity,height: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
              ),
              prefixIcon: IconButton(
                  icon: Icon(Icons.search)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              hintText: 'Search in all sections',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
    );
  }
}