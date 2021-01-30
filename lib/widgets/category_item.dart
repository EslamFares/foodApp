import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.path,
      arguments: {'id': id, 'title': title, 'color': color},
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Raleway',
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () => selectCategory(context),
    );
  }
}
