import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String answer;

  const Answer({this.selectAnswer,this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.answer),
        onPressed: this.selectAnswer,
      ),
    );
  }
}
