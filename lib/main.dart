import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: K.PrimaryColor,
        primaryColor: K.SecColor,
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      initialRoute: TabsScreen.path,
      routes: {
        TabsScreen.path: (context) => TabsScreen(),
        FavouriteScreen.path: (context) => FavouriteScreen(),
        CategoriesScreen.path: (context) => CategoriesScreen(),
        CategoryMealScreen.path: (context) => CategoryMealScreen(),
        MealDetailsScreen.path: (context) => MealDetailsScreen(),
        FilterScreen.path: (context) => FilterScreen(),
      },
    );
  }
}
