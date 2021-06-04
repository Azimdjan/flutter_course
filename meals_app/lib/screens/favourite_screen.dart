import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen(this.favouriteMeals);
  final List<Meal> favouriteMeals;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length,
      ),
    );
  }
}
