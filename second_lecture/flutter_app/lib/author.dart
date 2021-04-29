import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'circularImage.dart';
import 'fooderlich_theme.dart';

class AuthorCard extends StatelessWidget{
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  const AuthorCard({this.authorName,this.title,this.imageProvider});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircularImage(imageProvider,imageRadius: 28,),
          SizedBox(width: 8,),
          Column(
            children: [
              Text(authorName, style: FooderlichTheme.lightTextTheme.headline2,),
              Text(title,style: FooderlichTheme.lightTextTheme.headline3,)
            ],
          ),
          SizedBox(width: 40,),
          IconButton(
              icon: Icon(Icons.favorite_border),
              iconSize: 30,
              color: Colors.grey[400],
              onPressed: (){
                final snackBar = SnackBar(content: Text("Pressed Favourite"));
                Scaffold.of(context).showSnackBar(snackBar);})
        ],
      ),
    );
  }
}