import 'package:flutter/material.dart';
import 'package:meal_app/constant.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealIem extends StatelessWidget {
  final Meal dataMeal;
  final Function removeItem;
  const MealIem({@required this.dataMeal, this.removeItem});
  void selectMeal(context) {
    Navigator.pushNamed(context, MealDetailsScreen.path, arguments: dataMeal)
        .then((result) {
      //========================
      print(result);
      if (result != null) {
        return removeItem(result);
      }
    });
  }

  String get complexityText {
    switch (dataMeal.complexity) {
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (dataMeal.affordability) {
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => selectMeal(context),
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        color: K.SecColor,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    dataMeal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    // color: Colors.amber,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.black38,
                    child: Center(
                      child: Text(
                        dataMeal.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  // height: 50,
                )
              ],
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconText(Icons.schedule, '${dataMeal.duration} min'),
                  iconText(Icons.work, complexityText),
                  iconText(Icons.attach_money, affordabilityText),
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        margin: EdgeInsets.all(10),
      ),
    );
  }

  Row iconText(IconData iconData, String txt) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
