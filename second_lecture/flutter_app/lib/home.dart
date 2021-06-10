import 'package:flutter/material.dart';
import 'package:flutter_app/models/explore_recipe.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/screens/explore_screen.dart';
import 'package:flutter_app/screens/groceryScreen.dart';
import 'package:flutter_app/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

import 'api/mock_fooderlich_service.dart';

class Home extends StatefulWidget{
  const Home();
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  int _selectedIndex = 0;
  static List<Widget> pages = [
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>TabManager()),
        ChangeNotifierProvider(create: (context)=>GroceryManager()),
        ChangeNotifierProvider(create: (context)=>MockFooderlichService()),
      ],
      child: Consumer<TabManager>(builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
              title: Text("Fooderlich",
                style: Theme.of(context).textTheme.headline6,)
          ),
          body: IndexedStack(index: tabManager.selectedTab, children: pages,),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).textSelectionColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: "Recipes"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: "To Buy"),
            ],
            currentIndex: tabManager.selectedTab,
            onTap: (index){
              tabManager.goToTab(index);
            },
          ),
        );
      }
      ),
    );
  }
}