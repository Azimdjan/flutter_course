import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/fooderlich_theme.dart';

class Card3 extends StatelessWidget{
  const Card3();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mag2.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.all(const Radius.circular(10.0)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.book,color: Colors.white,size: 40),
                SizedBox(height: 8,),
                Text("Recipe Trends",style: FooderlichTheme.darkTextTheme.headline1,),
                SizedBox(height: 30,),
              ],
            )
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              children: [
                Chip(
                  label: Text("Healthy",style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () =>print("Deleted"),
                ),
                Chip(
                  label: Text("Vegan",style: FooderlichTheme.darkTextTheme.bodyText1),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () =>print("Deleted"),
                ),
                Chip(
                  label: Text("Carrots", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
                Chip(
                  label: Text("Greens", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
                Chip(
                  label: Text("Wheat", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
                Chip(
                  label: Text("Pescetarian", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
                Chip(
                  label: Text("Mint", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
                Chip(
                  label: Text("Lemongrass", style: FooderlichTheme.darkTextTheme.bodyText1,),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () => print("Deleted"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}