import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/explore_data.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/models/explore_recipe.dart';
import 'package:flutter_app/models/simple_recipe.dart';

class MockFooderlichService extends ChangeNotifier{
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();
    notifyListeners();
    return ExploreData(todayRecipes, friendPosts);
  }

  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    final Map<String,dynamic> json = jsonDecode(dataString);

    if(json['recipes']!=null){
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((v)=>recipes.add(ExploreRecipe.fromJson(v)));
      notifyListeners();
      return recipes;
    }
    else{
      notifyListeners();
      return [];
    }
  }

  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_friends_feed.json');
    final Map<String,dynamic> json = jsonDecode(dataString);

    if(json['feed']!=null){
      final post = <Post>[];
      json['feed'].forEach((v)=>post.add(Post.fromJson(v)));
      notifyListeners();
      return post;
    }
    else{
      notifyListeners();
      return [];
    }
  }

  Future<List<SimpleRecipe>> getRecipes() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/sample_recipes.json');
    final Map<String,dynamic> json = jsonDecode(dataString);

    if(json['recipes']!=null){
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((v)=>recipes.add(SimpleRecipe.fromJson(v)));
      notifyListeners();
      return recipes;
    }
    else{
      notifyListeners();
      return [];
    }
  }

  Future<String> _loadAsset(String path) async{
    return rootBundle.loadString(path);
  }
}