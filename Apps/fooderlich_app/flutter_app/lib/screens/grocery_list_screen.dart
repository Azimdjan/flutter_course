import 'package:flutter/material.dart';
import 'package:flutter_app/componets/grocery_tile.dart';
import 'package:flutter_app/models/grocery_manager.dart';
import 'package:flutter_app/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen(this.groceryManager);

  final GroceryManager groceryManager;

  @override
  Widget build(BuildContext context) {
    final groceryItems = groceryManager.groceItems;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          final item = groceryItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete_forever,
                size: 50,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              groceryManager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} dismissed!')),
              );
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  groceryManager.completeItem(index, change);
                },
              ),
              onTap: () {
                groceryManager.groceryItemTapped(index);
              },
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}
