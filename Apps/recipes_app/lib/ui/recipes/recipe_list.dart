import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../data/model/recipe.dart';
import '../../network/model_response.dart';
import '../../network/recipe_model.dart';
import '../../network/service_interface.dart';
import '../colors.dart';
import '../recipe_card.dart';
import 'recipe_details.dart';
import '../widgets/custom_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const prefSearchKey = '';
  TextEditingController searchTextController;
  final _scrollController = ScrollController();
  List<APIHits> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 5;
  int pageCount = 5;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  final controller = RefreshController(
    initialRefresh: false,
  );

  //APIRecipeQuery _currentRecipe1;

  @override
  void initState() {
    super.initState();
    //loadRecipes();
    getPreviousSearches();
    searchTextController = TextEditingController(text: '');
    // _scrollController
    //   ..addListener(() {
    //     final triggerFetchMoreSize =
    //         0.7 * _scrollController.position.maxScrollExtent;
    //
    //     if (_scrollController.position.pixels > triggerFetchMoreSize) {
    //       if (hasMore &&
    //           currentEndPosition < currentCount &&
    //           !loading &&
    //           !inErrorState) {
    //         setState(() {
    //           loading = true;
    //           currentStartPosition = currentEndPosition;
    //           currentEndPosition =
    //               min(currentStartPosition + pageCount, currentCount);
    //         });
    //       }
    //     }
    //   });
  }

  // Future loadRecipes() async {
  //   final jsonString = await rootBundle.loadString('assets/recipes1.json');
  //   setState(() {
  //     _currentRecipe1 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
  //   });
  // }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      previousSearches = prefs.getStringList(prefSearchKey);
      if (previousSearches == null) previousSearches = <String>[];
    }
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            // Replace
            IconButton(
              onPressed: () {
                startSearch(searchTextController.text);
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
              },
              icon: const Icon(Icons.search),
            ),
            const SizedBox(
              width: 6.0,
            ),
            // *** Start Replace
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Search'),
                autofocus: false,
                textInputAction: TextInputAction.done,
                controller: searchTextController,
                onSubmitted: (value) {
                  if (!previousSearches.contains(value)) {
                    previousSearches.add(value);
                    savePreviousSearches();
                  }
                },
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.arrow_drop_down,
                color: lightGrey,
              ),
              onSelected: (String value) {
                searchTextController.text = value;
                startSearch(searchTextController.text);
              },
              itemBuilder: (BuildContext context) {
                return previousSearches
                    .map<CustomDropdownMenuItem<String>>((String value) {
                  return CustomDropdownMenuItem<String>(
                    text: value,
                    value: value,
                    callback: () {
                      setState(() {
                        previousSearches.remove(value);
                        Navigator.of(context).pop();
                      });
                    },
                  );
                }).toList();
              },
            )
            // *** End Replace
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }

  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) return Container();
    return FutureBuilder<Response<Result<APIRecipeQuery>>>(
      future: Provider.of<ServiceInterface>(context).queryRecipes(
          searchTextController.text.trim(),
          currentStartPosition,
          currentEndPosition),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
              ),
            );
          loading = false;
          final result = snapshot.data.body;
          inErrorState = false;
          if (result is Error) {
            inErrorState = true;
            return _buildRecipeList(context, currentSearchList);
          }
          final query = (result as Success<APIRecipeQuery>).value;
          currentCount = query.count;
          hasMore = query.more;
          currentSearchList.addAll(query.hits);
          if (query.to < currentEndPosition) currentEndPosition = query.to;
          return _buildRecipeList(context, currentSearchList);
        } else {
          if (currentCount == 0)
            return const Center(child: CircularProgressIndicator());
          else
            return _buildRecipeList(context, currentSearchList);
        }
      },
    );
  }

  Widget _buildRecipeList(BuildContext recipeListContext, List<APIHits> hits) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 310;
    final itemWidth = size.width / 2;
    return Flexible(
        child: SmartRefresher(
          enablePullUp: true,
      enablePullDown: true,
      header: const WaterDropHeader(),
      onRefresh: (){
              if (hasMore &&
                  !loading &&
                  !inErrorState) {
                setState(() {
                  loading = true;
                  currentStartPosition = currentEndPosition;
                  currentEndPosition =
                      min(currentStartPosition + pageCount, currentCount);
                });
              }
        if (mounted) controller.refreshCompleted();
      },
      onLoading: () async{
              if (hasMore &&
                  !loading &&
                  !inErrorState) {
                setState(() {
                  loading = true;
                  currentStartPosition = currentEndPosition;
                  currentEndPosition =
                      min(currentStartPosition + pageCount, currentCount);
                });
              }
        if (mounted) controller.loadComplete();
      },
      controller: controller,
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: hits.length,
        itemBuilder: (ctx, index) {
          return _buildRecipeCard(recipeListContext, hits, index);
        },
      ),
    ));
  }

  Widget _buildRecipeCard(BuildContext ctx, List<APIHits> hits, int index) {
    final recipe = hits[index].recipe;
    print(recipe);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          final detailRecipe = Recipe(
            label: recipe.label,
            image: recipe.image,
            calories: recipe.calories,
            url: recipe.url,
            totalTime: recipe.totalTime,
            totalWeight: recipe.totalWeight,
          );
          detailRecipe.ingredients = convertIngredients(recipe.ingredients);
          return RecipeDetails(recipe: detailRecipe);
        }));
      },
      child: recipeStringCard(recipe),
    );
  }

// Future<APIRecipeQuery> getRecipeData(String query, int from, int to) async {
//   final recipeJson = await RecipeService().getRecipes(query, from, to);
//   final jsonMap = jsonDecode(recipeJson);
//   return APIRecipeQuery.fromJson(jsonMap);
// }
}
