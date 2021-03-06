import 'package:flutter/material.dart';
import 'package:flutter_app/models/grocery_manager.dart';
import 'package:flutter_app/screens/empty_grocery_screen.dart';
import 'package:flutter_app/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';
import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget{
  GroceryScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Provider.of<GroceryManager>(context,listen: false,).createNewItem();
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen(){
    return Consumer<GroceryManager>(
      builder: (contex,manager,child){
        if(manager.groceItems.isNotEmpty){
          //todo 25
          return GroceryListScreen(manager);
        }
        else{
          return EmptyGroceryScreen();
        }
      }
    );
  }

}