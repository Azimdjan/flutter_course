import 'package:flutter/cupertino.dart';

class CustomCard{
  final String title;
  final String author;
  final ImageProvider img;
  final String description;
  final String publishTime;

  const CustomCard({this.title,this.author,this.img,this.description,this.publishTime});
}