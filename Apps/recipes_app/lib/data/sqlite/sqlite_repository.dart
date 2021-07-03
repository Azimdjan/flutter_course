import '../model/ingredient.dart';

import '../model/recipe.dart';

import 'database_helper.dart';
import '../repository.dart';

class SqliteRepository extends Repository {
  final db = DatabaseHelper.instance;

  @override
  Future<List<Recipe>> findAllRecipes() {
    return db.findAllRecipes();
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    return db.watchAllRecipes();
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    return db.watchAllIngredients();
  }

  @override
  Future<Recipe> findRecipeById(int id){
    return db.findRecipeById(id);
  }

  @override
  Future<List<Ingredient>> findAllIngredients(){
    return db.findAllIngredients();
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int id){
    return db.findRecipeIngredients(id);
  }

  @override
  Future<int> insertRecipe(Recipe recipe){
    return Future(() async {
      final id = await db.insertRecipe(recipe);
      recipe.id = id;
      if(recipe.ingredients!=null){
         recipe.ingredients.forEach((element) {
           element.recipeId = id;
         });
      }
      insertIngredients(recipe.ingredients);
      return id;
    });
  }

  @override
  Future<List<int>> insertIngredients(List<Ingredient> ingredients) {
    return Future(() async {
      if(ingredients!=null&&ingredients.length!=0){
        final ingredientIDs = <int>[];
        await Future.forEach(ingredients, (ingredient) async {
          if(ingredient!=null){
            final futureId = await db.insertIngredient(ingredient);
            ingredient.id = futureId;
            ingredientIDs.add(futureId);
          }
        });
        return Future.value(ingredientIDs);
      }
      else{
        return Future.value(<int>[]);
      }
    });
  }

  @override
  Future<void> deleteRecipe(Recipe recipe){
    db.deleteRecipe(recipe);
    db.deleteRecipeIngredient(recipe.id);
    return Future.value();
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient){
    db.deleteIngredient(ingredient);
    return Future.value();
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients){
    db.deleteIngredients(ingredients);
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId){
    db.deleteRecipeIngredient(recipeId);
    return Future.value();
  }

  @override
  Future init() async {
    await db.database;
    return Future.value();
  }

  @override
  void close(){
    db.close();
  }
}
