import 'package:flutter/material.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:provider/provider.dart';

class GroceryManager extends ChangeNotifier{
  final _groceryItems = <GroceryItem>[];
  List<GroceryItem> get groceItems => List.unmodifiable(_groceryItems);

  void deleteItem(int index){
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItem item){
    _groceryItems.add(item);
    notifyListeners();
  }

  void updateItem(int index, GroceryItem item){
    _groceryItems[index] = item;
    notifyListeners();
  }

  void completeItem(int index,bool changes){
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: changes);
    notifyListeners();
  }
}