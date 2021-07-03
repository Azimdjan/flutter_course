import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/explore_recipe.dart';
import 'package:flutter_app/models/post.dart';

class ExploreData extends ChangeNotifier{
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendsPost;

  ExploreData(this.todayRecipes,this.friendsPost);
}