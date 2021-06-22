// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Ingredient extends Equatable {
  int id;
  int recipeId;
  final String name;
  final double weight;

  Ingredient({
    required this.id,
    required this.recipeId,
    required this.name,
    required this.weight,
  });

  @override
  List<Object> get props => [recipeId, name, weight];
}
