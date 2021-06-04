import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/repo/3.2%20dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> filteredMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  void _toggleFavouriteMeal(String id) {
    final mealIndex = favouriteMeals.indexWhere((meal) => meal.id == id);
    if (mealIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool isFavourite(String id){
    return favouriteMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      filteredMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filters['gluten'] == true && !meal.isGlutenFree)
            return false;
          else if (_filters['lactose'] == true && !meal.isLactoseFree)
            return false;
          else if (_filters['vegetarian'] == true && !meal.isVegetarian)
            return false;
          else if (_filters['vegan'] == true && !meal.isVegan)
            return false;
          else
            return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontWeight: FontWeight.bold,
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(filteredMeals),
        MealDetail.routeName: (ctx) => MealDetail(isFavourite,_toggleFavouriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoryScreen();
        });
      },
    );
  }
}
