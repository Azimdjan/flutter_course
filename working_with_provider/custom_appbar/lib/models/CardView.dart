import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customCard.dart';

class CardView extends StatelessWidget{
  final String title;
  final String author;
  final String img;
  final String description;
  final String publishTime;

  const CardView({this.title,this.author,this.img,this.description,this.publishTime});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.author, style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 8,),
          Text(this.title,style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal
          ),),
          SizedBox(height: 12,),
          Flexible(
            child: Text(
              this.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal
            ),),
          ),
          SizedBox(height: 5,),
          Text(this.publishTime,style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal
          ),),
          SizedBox(height: 5,),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 141,
              child: Image.network(this.img,fit: BoxFit.cover,),
            ),
          )
        ],
      )
    );
  }}