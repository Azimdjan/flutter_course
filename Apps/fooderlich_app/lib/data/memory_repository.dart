import 'model/ingredient.dart';
import 'model/recipe.dart';
import 'repository.dart';
import 'dart:async';

class MemoryRepository extends Repository {
  final List<Recipe> _currentRecipes = <Recipe>[];
  final List<Ingredient> _currentIngredients = <Ingredient>[];
  Stream<List<Recipe>> _recipeStream;
  Stream<List<Ingredient>> _ingredientStream;
  final StreamController _recipeStreamController =
      StreamController<List<Recipe>>();
  final StreamController _ingredientStreamController =
      StreamController<List<Ingredient>>();

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    if (_recipeStream == null) _recipeStream = _recipeStreamController.stream;
    return _recipeStream;
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    if (_ingredientStream == null)
      _ingredientStream = _ingredientStreamController.stream;
    return _ingredientStream;
  }

  @override
  Future init() {
    return Future.value();
  }

  @override
  void close() {
    _recipeStreamController.close();
    _ingredientStreamController.close();
  }

  @override
  Future<List<Recipe>> findAllRecipes() {
    return Future.value(_currentRecipes);
  }

  @override
  Future<Recipe> findRecipeById(int id) {
    return Future.value(
        _currentRecipes.firstWhere((element) => element.id == id));
  }

  @override
  Future<List<Ingredient>> findAllIngredients() {
    return Future.value(_currentIngredients);
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int recipeId) {
    // final recipe =
    //     _currentRecipes.firstWhere((element) => element.id == recipeId);
    final ingredients = _currentIngredients
        .where((element) => element.recipeId == recipeId)
        .toList();
    return Future.value(ingredients);
  }

  @override
  Future<int> insertRecipe(Recipe recipe) {
    _currentRecipes.add(recipe);
    _recipeStreamController.sink.add(_currentRecipes);
    insertIngredients(recipe.ingredients);
    return Future.value(0);
  }

  @override
  Future<List<int>> insertIngredients(List<Ingredient> ingredients) {
    if (ingredients != null && ingredients.length != 0) {
      _currentIngredients.addAll(ingredients);
      _ingredientStreamController.sink.add(_currentIngredients);
    }
    return Future.value(<int>[]);
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient) {
    _currentIngredients.remove(ingredient);
    _ingredientStreamController.sink.add(_currentIngredients);
    return Future.value();
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    _currentIngredients.removeWhere((element) => ingredients.contains(element));
    _ingredientStreamController.sink.add(_currentIngredients);
    return Future.value();
  }

  @override
  Future<void> deleteRecipe(Recipe recipe) {
    _currentRecipes.remove(recipe);
    deleteRecipeIngredients(recipe.id);
    _ingredientStreamController.sink.add(_currentIngredients);
    _recipeStreamController.sink.add(_currentRecipes);
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId) {
    _currentIngredients.removeWhere((element) => element.recipeId == recipeId);
    _ingredientStreamController.sink.add(_currentIngredients);
    return Future.value();
  }
}
