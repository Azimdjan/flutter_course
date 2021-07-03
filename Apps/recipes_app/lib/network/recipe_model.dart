import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import '../data/model/ingredient.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class APIRecipeQuery {
  factory APIRecipeQuery.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIRecipeQueryToJson(this);

  @JsonKey(name: 'q')
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;

  APIRecipeQuery({
    @required this.count,
    @required this.from,
    @required this.hits,
    @required this.more,
    @required this.query,
    @required this.to,
  });
}

@JsonSerializable()
class APIHits {
  APIRecipe recipe;

  APIHits({@required this.recipe});

  factory APIHits.fromJson(Map<String, dynamic> json) =>
      _$APIHitsFromJson(json);

  Map<String, dynamic> toJson() => _$APIHitsToJson(this);
}

@JsonSerializable()
class APIRecipe {
  String label;
  String image;
  String url;
  List<APIIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  APIRecipe({
    @required this.label,
    @required this.image,
    @required this.url,
    @required this.ingredients,
    @required this.calories,
    @required this.totalTime,
    @required this.totalWeight,
  });

  factory APIRecipe.fromJson(Map<String, dynamic> json) =>
      _$APIRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$APIRecipeToJson(this);

}

String getCalories(double calories) {
  if (calories == null)
    return '0 KCAl';
  else
    return calories.floor().toString() + 'KCAL';
}

String getWeight(double weight) {
  if (weight == null)
    return '0 g';
  else
    return weight.floor().toString() + ' g';
}

@JsonSerializable()
class APIIngredients {
  @JsonKey(name: 'text')
  String name;
  double weight;

  APIIngredients({
    @required this.name,
    @required this.weight,
  });

  factory APIIngredients.fromJson(Map<String, dynamic> json) =>
      _$APIIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$APIIngredientsToJson(this);
}

List<Ingredient> convertIngredients(List<APIIngredients> apiIngredients) {
  final ingredients = <Ingredient>[];
  apiIngredients.forEach((ingredient) => ingredients
      .add(Ingredient(name: ingredient.name, weight: ingredient.weight)));
  return ingredients;
}
