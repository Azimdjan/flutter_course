import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_state.dart';
import 'package:flutter_app/models/fooderlich_pages.dart';
import 'package:flutter_app/models/profile_manager.dart';
import 'package:flutter_app/screens/explore_screen.dart';
import 'package:flutter_app/screens/groceryScreen.dart';
import 'package:flutter_app/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final int currentTab;

  Home(this.currentTab);

  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: FooderlichPages.home,
      key: ValueKey(FooderlichPages.home),
      child: Home(currentTab),
    );
  }

  static List<Widget> pages = [
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            profileButton(context),
          ],
          title: Text(
            "Fooderlich",
            style: Theme.of(context).textTheme.headline6,
          )),
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "To Buy"),
        ],
        currentIndex: currentTab,
        onTap: (index) {
          Provider.of<AppStateManager>(context,listen: false).goToTab(index);
        },
      ),
    );
  }

  Widget profileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
              'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: (){
          Provider.of<ProfileManager>(context,listen: false).tapOnProfile(true);
        },
      )
    );
  }
}
