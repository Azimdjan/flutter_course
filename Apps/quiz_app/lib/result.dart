import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  const Result(this.totalScore, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Your score is ${this.totalScore}!", style: TextStyle(fontSize: 28),),
        ),
        TextButton(
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: this.resetQuiz,
          child: Text("Reset Quiz!"),
        ),
      ],
    );
  }
}
