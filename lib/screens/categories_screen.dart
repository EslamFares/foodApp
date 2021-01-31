import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String path = 'CategoriesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(catData.id, catData.title, catData.color),
            )
            .toList(),
      ),
    );
  }
}
