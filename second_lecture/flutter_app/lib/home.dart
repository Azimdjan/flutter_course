import 'package:flutter/material.dart';
import 'package:flutter_app/models/explore_recipe.dart';
import 'package:flutter_app/screens/explore_screen.dart';
import 'package:flutter_app/screens/recipes_screen.dart';

import 'componets/Card1.dart';
import 'componets/Card2.dart';
import 'componets/Card3.dart';

class Home extends StatefulWidget{
  const Home();
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State{
  int _selectedIndex = 0;
  static List<Widget> pages = [
    ExploreScreen(),
    RecipeScreen(),
    Container(color: Colors.blue, child:Center(child:Text("In the upcoming version!"))),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fooderlich",
        style: Theme.of(context).textTheme.headline6,)
      ),
      body: Container(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore")),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text("Recipes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("To Buy")),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }

}