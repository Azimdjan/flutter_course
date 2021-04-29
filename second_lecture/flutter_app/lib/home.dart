import 'package:flutter/material.dart';

import 'Card1.dart';
import 'Card2.dart';
import 'Card3.dart';

class Home extends StatefulWidget{
  const Home();
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State{
  int _selectedIndex = 0;
  static List<Widget> pages = [
    Card1(),
    Card2(),
    Card3(),
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
        padding: EdgeInsets.fromLTRB(16, 40, 16, 40),
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text("Card")),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text("Card 2")),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text("Card 3")),
        ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }

}