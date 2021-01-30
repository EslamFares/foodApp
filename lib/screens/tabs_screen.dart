import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import '../constant.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String path = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int index = 0;
  List bodyScreen = [CategoriesScreen(), FavouriteScreen()];
  List appBarTitle = ['Meal App', 'Favourite'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          appBarTitle[index],
          style: TextStyle(
              color: K.thColor,
              fontSize: 24,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,

          ),
        ),
      ),
      body: bodyScreen[index],
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: MainDrawer(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: K.SecColor,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      currentIndex: index,
      iconSize: 30,
      selectedIconTheme: IconThemeData(color: K.thColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('')),
        // BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('')),
      ],
    );
  }
}
