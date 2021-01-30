import 'package:flutter/material.dart';
import 'package:meal_app/constant.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: K.PrimaryColor,
          child: Column(
            children: [
              topContainer(),
              SizedBox(
                height: 20.0,
              ),
              buildListTile(
                title: 'Meal',
                icon: Icons.restaurant,
                function: () {
                  Navigator.of(context).pushReplacementNamed(TabsScreen.path);
                },
                color: Colors.greenAccent,
              ),
              buildListTile(
                title: 'Filters',
                icon: Icons.settings,
                function: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed(FilterScreen.path);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(
      {String title, IconData icon, Function function, Color color}) {
    return ListTile(
      onTap: function,
      leading: Icon(
        icon,
        size: 26,
        color: color ?? Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Container topContainer() {
    return Container(
      height: 100,
      width: double.infinity,
      color: K.SecColor,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      child: Text(
        'Cooking up ! ',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w800,
          color: K.thColor,
        ),
      ),
    );
  }
}
