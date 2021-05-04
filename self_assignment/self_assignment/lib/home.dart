import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:self_assignment/components/components.dart';
import 'package:self_assignment/screens/home_screen.dart';
import 'package:self_assignment/themes/themes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          constraints: BoxConstraints.expand(width: double.infinity,height: 100),
          child: Stack(
            children: [
              Positioned(
                top: 13,
                left: 12,
                child: Text("Ramble",style: Theme.of(context).textTheme.headline2,),
              ),
              Positioned(
                top: 42,
                left: 13,
                child: Text("Make yourself an unforgettable adventure!",style: Theme.of(context).textTheme.bodyText1,),
              )
            ],
          )
        ),
      ),
    );
  }
}