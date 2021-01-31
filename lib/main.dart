import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'constant.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

//=====================================
  List<Meal> _favouriteMeals = [];
  void _addFavourite(String mealID) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }
  bool _isMealFavourite(String id){
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: K.PrimaryColor,
          primaryColor: K.SecColor,
          fontFamily: 'Raleway',
          textTheme: ThemeData.dark()
              .textTheme
              .apply(bodyColor: Colors.white, fontFamily: 'Raleway')),
      initialRoute: TabsScreen.path,
      routes: {
        TabsScreen.path: (context) => TabsScreen(_favouriteMeals),
        CategoriesScreen.path: (context) => CategoriesScreen(),
        CategoryMealScreen.path: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailsScreen.path: (context) => MealDetailsScreen(_addFavourite,_isMealFavourite),
        FilterScreen.path: (context) => FilterScreen(_filters, _setFilter),
      },
    );
  }
}
