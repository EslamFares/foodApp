import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const String path = 'FilterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FilterScreen'),
      ),
      body: Container(),
      drawer: MainDrawer(),
    );
  }
}
