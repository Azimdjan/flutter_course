import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget{
  Widget child;
  MainLayout(this.child);
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  blurRadius: 11,
                  offset: Offset(0,4),
                  color: Color(0xFFE9EAEF),
                )
              ]
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children: [
                Icon(Icons.home),
                SizedBox(width: 20,),
                Text('News',style: TextStyle(color: Colors.black,fontSize: 17),),
              ],
            )
          ),
        ),
      ),
      body: Container(
        child: widget.child,
        color: Colors.white,
        //constraints: BoxConstraints.expand(),
      ),
    );
  }
}