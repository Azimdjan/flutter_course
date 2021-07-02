import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../data/repository.dart';
import '../../data/model/recipe.dart';

class MyRecipesList extends StatefulWidget {
  const MyRecipesList({Key key}) : super(key: key);

  @override
  _MyRecipesListState createState() => _MyRecipesListState();
}

class _MyRecipesListState extends State<MyRecipesList> {
  // TODO 1
  List<Recipe> recipes;

  // TODO 2
  @override
  void initState() {
    super.initState();
    //recipes = <String>[];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildRecipeList(context),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    // TODO 3
    final repository = Provider.of<Repository>(context,listen: false);
    return StreamBuilder(
        stream: repository.watchAllRecipes(),
        builder: (context, AsyncSnapshot<List<Recipe>> snapshot){
      if(snapshot.connectionState == ConnectionState.active) {
        recipes = snapshot.data ?? [];
        return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              final recipe = recipes[index];
              // TODO 4
              return SizedBox(
                height: 100,
                child: Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CachedNetworkImage(
                            // TODO 5
                              imageUrl: recipe.image,
                              height: 120,
                              width: 60,
                              fit: BoxFit.cover),
                          // TODO 6
                          title: Text(recipe.label),
                        ),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        foregroundColor: Colors.black,
                        iconWidget: const Icon(Icons.delete, color: Colors.red),
                        // TODO 7
                        onTap: () {
                          deleteRecipe(repository, recipe);
                        })
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        foregroundColor: Colors.black,
                        iconWidget: const Icon(Icons.delete, color: Colors.red),
                        // TODO 8
                        onTap: () {})
                  ],
                ),
              );
            });
      }
      else{
        return Container();
      }
    });
    // TODO 9
  }

  void deleteRecipe(Repository repository, Recipe recipe) async {
    repository.deleteRecipeIngredients(recipe.id);
    repository.deleteRecipe(recipe);
    setState(() {});
  }
}
