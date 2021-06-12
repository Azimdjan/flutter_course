import 'package:flutter/material.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:provider/provider.dart';

class GroceryManager extends ChangeNotifier{
  final _groceryItems = <GroceryItem>[];
  int _selectedIndex = null;
  bool _createNewItem = false;
  List<GroceryItem> get groceItems => List.unmodifiable(_groceryItems);
  int get selectedIndex => _selectedIndex;
  bool get isCreateNewItem => _createNewItem;
  GroceryItem get selectedGroceryItem => groceItems[_selectedIndex];

  void setSelectedGroceryItem(String id){
    final index= groceItems.indexWhere((element) => element.id ==id);
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void deleteItem(int index){
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void createNewItem(){
    _createNewItem = true;
    notifyListeners();
  }

  void groceryItemTapped(int index){
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  void addItem(GroceryItem item){
    _groceryItems.add(item);
    _createNewItem = false;
    notifyListeners();
  }

  void updateItem(int index, GroceryItem item){
    _groceryItems[index] = item;
    _selectedIndex = null;
    _createNewItem = false;
    notifyListeners();
  }

  void completeItem(int index,bool changes){
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: changes);
    notifyListeners();
  }
}