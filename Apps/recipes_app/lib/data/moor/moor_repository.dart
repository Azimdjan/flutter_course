import 'dart:async';
import '../model/ingredient.dart';
import '../model/recipe.dart';

import '../repository.dart';
import 'moor_db.dart';

class MoorRepository extends Repository {
  RecipeDatabase recipeDatabase;
  RecipeDao _recipeDao;
  IngredientDao _ingredientDao;

  Stream<List<Recipe>> recipeStream;
  Stream<List<Ingredient>> ingredientStream;

  @override
  Future init() async {
    recipeDatabase = RecipeDatabase();
    _recipeDao = recipeDatabase.recipeDao;
    _ingredientDao = recipeDatabase.ingredientDao;
  }

  @override
  void close() {
    recipeDatabase.close();
  }

  @override
  Future<List<Recipe>> findAllRecipes() {
    return _recipeDao
        .findAllRecipes()
        .then<List<Recipe>>((List<MoorRecipeData> moorRecipes) {
      final recipes = <Recipe>[];
      moorRecipes.forEach((moorRecipe) async {
        final recipe = moorRecipeToRecipe(moorRecipe);
        recipe.ingredients = await findRecipeIngredients(recipe.id);
        recipes.add(recipe);
      });
      return recipes;
    });
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    if (recipeStream == null) return _recipeDao.watchAllRecipes();
    return recipeStream;
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    if (ingredientStream == null) {
      final stream = _ingredientDao.watchAllIngredients();
      ingredientStream = stream.map((moorIngredients) {
        final ingredients = <Ingredient>[];
        moorIngredients.forEach((moorIngredient) {
          ingredients.add(moorIngredienToIngredient(moorIngredient));
        });
        return ingredients;
      });
    }
    return ingredientStream;
  }

  @override
  Future<Recipe> findRecipeById(int id) {
    return _recipeDao.findRecipeById(id).then((listOfRecipes) {
      return moorRecipeToRecipe(listOfRecipes.first);
    });
  }

  @override
  Future<List<Ingredient>> findAllIngredients() {
    return _ingredientDao
        .findAllIngredients()
        .then<List<Ingredient>>((List<MoorIngredientData> moorIngredients) {
      final ingredients = <Ingredient>[];
      moorIngredients.forEach((moorIngredient) {
        ingredients.add(moorIngredienToIngredient(moorIngredient));
      });
      return ingredients;
    });
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int recipeId) {
    return _ingredientDao
        .findRecipeIngredients(recipeId)
        .then((listOfIngredients) {
      final ingredients = <Ingredient>[];
      listOfIngredients.forEach((moorIngredient) {
        ingredients.add(moorIngredienToIngredient(moorIngredient));
      });
      return ingredients;
    });
  }

  @override
  Future<int> insertRecipe(Recipe recipe) {
    return Future(() async {
      final id =
          await _recipeDao.insertRecipe(recipeToInsertableMoorRecipe(recipe));
      recipe.ingredients.forEach((ingredient) {
        ingredient.id = id;
      });
      insertIngredients(recipe.ingredients);
      return id;
    });
  }

  @override
  Future<List<int>> insertIngredients(List<Ingredient> ingredients) {
    return Future(() {
      if (ingredients == null && ingredients.length == 0) {
        return <int>[];
      }
      final resultIds = <int>[];
      ingredients.forEach((ingredient) {
        final moorIngredient = ingredientToInsertableMoorIngredient(ingredient);
        _ingredientDao
            .insertIngredient(moorIngredient)
            .then((int id) => resultIds.add(id));
      });
      return resultIds;
    });
  }

  @override
  Future<void> deleteRecipe(Recipe recipe){
    _recipeDao.deleteRecipe(recipe.id);
    return Future.value();
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient){
    return _ingredientDao.deleteIngredient(ingredient.id);
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients){
    ingredients.forEach((ingredient) {
      _ingredientDao.deleteIngredient(ingredient.id);
    });
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId) async {
    final ingredients = await findRecipeIngredients(recipeId);
    return deleteIngredients(ingredients);
  }
}
