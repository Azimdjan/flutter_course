import 'package:flutter/material.dart';
import 'package:self_assignment/components/CardRamble.dart';
import 'package:self_assignment/components/components.dart';
import 'package:self_assignment/components/gridViewCards.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputBox(),
          SizedBox(height: 20,),
          HorizontalButtons(),
          SizedBox(height: 20,),
          Expanded(
            child: GridViewCards(),
          )
        ],
      ),
    );
  }
  
}