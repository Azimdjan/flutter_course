import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:text_controller/components/LoginButton.dart';
import 'package:text_controller/components/text_editor_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: [
          Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100,),
                Text(
                  'Instagram', style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                InputTextField(hint: "Username",isPassword: false),
                SizedBox(height: 20),
                InputTextField(hint: "Password",isPassword: true,),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          "Forgot password",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue, fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline)
                      ),
                    ]
                ),
                SizedBox(height: 20,),
                LoginButton(),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
