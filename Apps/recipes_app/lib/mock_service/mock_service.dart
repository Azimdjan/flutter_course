import 'dart:convert';
import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../network/model_response.dart';
import '../network/recipe_model.dart';
import '../network/service_interface.dart';

class MockService implements ServiceInterface{
  APIRecipeQuery _currentRecipe1;
  APIRecipeQuery _currentRecipe2;

  Random nextRecipe = Random();

  void create() {
    loadRecipes();
  }

  void loadRecipes() async {
    var jsonString = await rootBundle.loadString('assets/recipes1.json');
    _currentRecipe1 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
    jsonString = await rootBundle.loadString('assets/recipes2.json');
    _currentRecipe2 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(String query, int from,
      int to) {
    switch (nextRecipe.nextInt(2)) {
      case 0:
        return Future.value(
          Response(null, Success<APIRecipeQuery>(_currentRecipe1)),
        );
      case 1:
        return Future.value(
          Response(null, Success<APIRecipeQuery>(_currentRecipe2)),
        );
      default:
        return Future.value(
          Response(null,Success<APIRecipeQuery>(_currentRecipe1)),
        );
    }
  }
}