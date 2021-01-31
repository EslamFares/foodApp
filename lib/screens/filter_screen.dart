import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../constant.dart';

class FilterScreen extends StatefulWidget {
  static const String path = 'FilterScreen';
  final Function saveFilters;
  final Map<String, bool> filters;

  const FilterScreen(this.filters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilter);
              })
        ],
      ),
      body: Column(
        children: [
          titleContainer(),
          Expanded(
            child: listSwitch(),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  ListView listSwitch() {
    return ListView(
      children: [
        SwitchListTile(
            title: Text('Gluten-free'),
            subtitle: Text('Only include gluten-free meals.'),
            value: _glutenFree,
            onChanged: (value) {
              setState(() {
                _glutenFree = value;
              });
            }),
        SwitchListTile(
            title: Text('lactose-free'),
            subtitle: Text('Only include lactose-free meals.'),
            value: _lactoseFree,
            onChanged: (value) {
              setState(() {
                _lactoseFree = value;
              });
            }),
        SwitchListTile(
            title: Text('Vegan'),
            subtitle: Text('Only include vegan meals.'),
            value: _vegan,
            onChanged: (value) {
              setState(() {
                _vegan = value;
              });
            }),
        SwitchListTile(
            title: Text('Vegetarian'),
            subtitle: Text('Only include vegetarian meals.'),
            value: _vegetarian,
            onChanged: (value) {
              setState(() {
                _vegetarian = value;
              });
            }),
      ],
    );
  }

  Container titleContainer() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Adjust your meal selection',
        style: TextStyle(
          color: K.thColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
