import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/mock_fooderlich_service.dart';
import 'package:flutter_app/componets/components.dart';
import 'package:flutter_app/componets/friend_post_list_view.dart';
import 'package:flutter_app/models/models.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final mockService = MockFooderlichService();
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          var recipes = snapshot.data.todayRecipes;
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: recipes),
              SizedBox(height: 16,),
              FriendPostListView(friendPosts: snapshot.data.friendsPost,)
            ],
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    // return Consumer<MockFooderlichService>(builder: (context,data,child) {
    //   var todays_Recipes = data.getExploreData();
    //   return ListView(
    //     scrollDirection: Axis.vertical,
    //     children: [
    //       TodayRecipeListView(recipes: todays_Recipes.recipes,),
    //       SizedBox(height: 16,),
    //       FriendPostListView(friendPosts: todays_Recipes.friendPost,)
    //     ],
    //   );
    // }
    // );
  }
  
}