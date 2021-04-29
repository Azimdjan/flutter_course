import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget{
  const CircularImage(this.imageProvider,{this.imageRadius = 20});
  final double imageRadius;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }

}