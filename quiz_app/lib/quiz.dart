import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz({this.questions,this.answerQuestion,this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>)
            .map((answer) => Answer(
          selectAnswer: ()=> answerQuestion(answer['score']),
          answer: answer['text'],
        )),
      ],
    );
  }
}
