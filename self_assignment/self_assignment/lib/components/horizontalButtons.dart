import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components.dart';

class HorizontalButtons extends StatelessWidget{
  const HorizontalButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
          Button(text: "Hotel",icon: Icons.hotel),
          SizedBox(width: 10,),
          Button(text: "Places",icon: Icons.place),
          SizedBox(width: 10,),
          Button(text: "Travel",icon: Icons.card_travel),
          SizedBox(width: 10,),
          Button(text: "Popular",icon: Icons.fire_extinguisher),
      ],
      ),
    );
  }
}