import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout(this.child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tashkent, Uzbekistan",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.blue.withOpacity(0.8),),
        drawer: Drawer(),
        body: child
    );
  }
}