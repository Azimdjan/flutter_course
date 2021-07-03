// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Ingredient extends Equatable {
  int id;
  int recipeId;
  final String name;
  final double weight;

  Ingredient({
    this.id,
    this.recipeId,
    this.name,
    this.weight,
  });

  @override
  List<Object> get props => [recipeId, name, weight];

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      Ingredient(
        id: json['_ingredientId'],
        recipeId: json['recipeId'],
        name: json['name'],
        weight: json['weight'],
      );

  Map<String, dynamic> toJson() =>
      {
        '_ingredientId': id,
        'recipeId': recipeId,
        'name': name,
        'weight': weight,
      };
}
