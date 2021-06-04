import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import 'category_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favouriteMeals);

  final List<Meal> favouriteMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // TODO: implement widget
  List<Map<String, Object>> pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourite'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              backgroundColor: Theme.of(context).accentColor,
              label: 'Favourite'),
        ],
      ),
    );
  }
}
