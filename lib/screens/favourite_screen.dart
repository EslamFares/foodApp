import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  static const String path = 'FavouriteScreen';
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: favouriteMeals.isEmpty ? noFavourites() : showFavoriteItem());
  }

  Container showFavoriteItem() {
    return Container(
      child: ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (context, index) {
          return MealIem(
            dataMeal: favouriteMeals[index],
          );
        },
      ),
    );
  }

  Container noFavourites() {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.no_food,color: Colors.white,size: 100,),
            SizedBox(height: 50),
            Text(
              'You have no favourites yet ... ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text('start adding some!'),
          ],
        ));
  }
}
