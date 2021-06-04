import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  
  void _tapHandler(BuildContext context, String routeName){
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                onTap: ()=>_tapHandler(context,'/'),
                leading: Icon(
                  Icons.restaurant,
                  size: 28,
                ),
                title: Text(
                  "Meals",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              ListTile(
                onTap: ()=>_tapHandler(context, FiltersScreen.routeName),
                leading: Icon(
                  Icons.settings,
                  size: 28,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
