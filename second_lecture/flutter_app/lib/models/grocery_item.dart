import 'package:flutter/material.dart';

enum Importance {low,medium,high}
class GroceryItem{
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime time;
  final bool isComplete;

  GroceryItem({
    this.id,
    this.name,
    this.importance,
    this.color,
    this.quantity,
    this.time,
    this.isComplete=false,});

  GroceryItem copyWith({
  String id,
  String name,
    Importance importance,
    Color color,
    int quantity,
    DateTime time,
    bool isComplete,}){
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this. quantity,
      time: time ?? this.time,
      isComplete: isComplete ?? this.isComplete
    );
  }
}