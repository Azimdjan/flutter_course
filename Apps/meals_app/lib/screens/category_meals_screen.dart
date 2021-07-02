import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> filteredMeals;
  CategoryMealsScreen(this.filteredMeals);
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String _categoryTitle;
  late List<Meal> _categoryMeals;
  bool _isChanged = false;

  @override
  void didChangeDependencies() {
    if (!_isChanged) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'].toString();
      final categoryId = routeArgs['id'].toString();
      _categoryMeals = widget.filteredMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _isChanged = true;
    }
    super.didChangeDependencies();
  }

  void _deleteMeal(String id){
    setState(() {
      _categoryMeals.removeWhere((meal) => id==meal.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(
              id: _categoryMeals[index].id,
              title: _categoryMeals[index].title,
              imageUrl: _categoryMeals[index].imageUrl,
              affordability: _categoryMeals[index].affordability,
              complexity: _categoryMeals[index].complexity,
              duration: _categoryMeals[index].duration,
            );
          },
          itemCount: _categoryMeals.length,
        ),
      ),
    );
  }
}
