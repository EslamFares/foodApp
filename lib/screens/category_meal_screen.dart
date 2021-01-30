import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String path = 'CategoryMealScreen';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  Color color;
  List<Meal> categoryMeals;
  @override
  void didChangeDependencies() {
    Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    final String id = data['id'];
    title = data['title'];
    color = data['color'];
    categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealIem(
            dataMeal: categoryMeals[index],
            removeItem: removeMeal,
          );
        },
      ),
    );
  }
}
