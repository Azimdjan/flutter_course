import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'circularImage.dart';
import '../fooderlich_theme.dart';

class AuthorCard extends StatefulWidget{
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  const AuthorCard({this.authorName,this.title,this.imageProvider});

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircularImage(widget.imageProvider,imageRadius: 28,),
          SizedBox(width: 8,),
          Column(
            children: [
              Text(widget.authorName, style: FooderlichTheme.lightTextTheme.headline2,),
              Text(widget.title,style: FooderlichTheme.lightTextTheme.headline3,)
            ],
          ),
          SizedBox(width: 30,),
          IconButton(
              icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
              iconSize: 30,
              color: Colors.red[400],
              onPressed: () {
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              }
          ),
        ],
      ),
    );
  }
}