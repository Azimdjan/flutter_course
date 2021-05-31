import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var questions = [
    {
      "questionText": "What is your favourite color!",
      "answer": [
        {"text": "Black", "score": 20},
        {"text": "Blue", "score": 3},
        {"text": "Red", "score": 12},
        {"text": "Yellow", "score": 14}
      ]
    },
    {
      "questionText": "What is your favourite animal!",
      "answer": [
        {"text": "Lion", "score": 20},
        {"text": "Cat", "score": 3},
        {"text": "Bear", "score": 12},
        {"text": "Tiger", "score": 14}
      ]
    },
    {
      "questionText": "What is your favourite football player!",
      "answer": [
        {"text": "Messi", "score": 20},
        {"text": "Ronaldo", "score": 20},
        {"text": "Neymar", "score": 3},
        {"text": "Mbappe", "score": 12},
        {"text": "Holland", "score": 14}
      ]
    },
  ];

  void answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Quiz App"),
            ),
          ),
          body: _questionIndex < questions.length
              ? Quiz(questions: questions,
            answerQuestion: answerQuestion,
            questionIndex: _questionIndex,)
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
