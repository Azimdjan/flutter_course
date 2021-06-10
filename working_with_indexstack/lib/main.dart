import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var answer = '';
  var textController = TextEditingController();
  var index = 0;
  int time = 0;

  @override
  void initState() {
    textController.text = 'Iltimos misol kiriting:';
    super.initState();
  }

  void retry() {
    setState(() {
      index = 0;
      textController.text = 'Iltimos misol kiriting:';
    });
  }

  String findAnswer(String expression) {
    var answer = '';
    var withoutSpaces = expression.trim();
    var listOfNumbers = withoutSpaces.split(RegExp(r"[+,-,/,*,%, ]"));
    var listOfNumbersWithoutSpaces =
        listOfNumbers.where((element) => element != '').toList();
    var indexOfOperator = withoutSpaces.indexOf(RegExp('[+,-,*,/]'));
    var operator = withoutSpaces[indexOfOperator];
    if (operator == '+') {
      answer = (double.parse(listOfNumbersWithoutSpaces[0]) +
              double.parse(listOfNumbersWithoutSpaces[1]))
          .toStringAsFixed(2);
    } else if (operator == '-') {
      answer = (double.parse(listOfNumbersWithoutSpaces[0]) -
              double.parse(listOfNumbersWithoutSpaces[1]))
          .toStringAsFixed(2);
    } else if (operator == '*') {
      answer = (double.parse(listOfNumbersWithoutSpaces[0]) *
              double.parse(listOfNumbersWithoutSpaces[1]))
          .toStringAsFixed(2);
    } else if (operator == '/') {
      answer = (double.parse(listOfNumbersWithoutSpaces[0]) /
              double.parse(listOfNumbersWithoutSpaces[1]))
          .toStringAsFixed(2);
    } else
      answer = 'Invalid operator!';
    return answer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Natijani topish!"),
        ),
        body: IndexedStack(
          index: index,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.shade200,
              ),
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: textController,
                    onTap: () {
                      setState(() {
                        textController.text = '';
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                        answer = findAnswer(textController.text);
                          Timer.periodic(Duration(seconds: 1), (timer) {
                            if (time == 5) {
                              timer.cancel();
                              setState(() {
                                index++;
                              });
                            } else
                              setState(() {
                                time++;
                              });
                          });
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(time.toString()),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 25, right: 25, left: 25, bottom: 5),
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      answer,
                      style: TextStyle(color: Colors.black, fontSize: 48),
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Retry",
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                  onPressed: retry,
                )
              ],
            ),
          ],
        ));
  }
}
