import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;
  final Function setFilters;

  FiltersScreen(this.currentFilters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _areGlutenFree = false;
  var _areLactoseFree = false;
  var _areVegetarian = false;
  var _areVegan = false;

  @override
  void initState() {
    _areGlutenFree = widget.currentFilters['glutenFree'];
    _areLactoseFree = widget.currentFilters['lactoseFree'];
    _areVegetarian = widget.currentFilters['vegetarian'];
    _areVegan = widget.currentFilters['vegan'];
    super.initState();
  }

  void _setFilters() {
    widget.setFilters({
      'glutenFree': _areGlutenFree,
      'lactoseFree': _areLactoseFree,
      'vegetarian': _areVegetarian,
      'vegan': _areVegan,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _setFilters,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: _setFilters,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  value: _areGlutenFree,
                  onChanged: (newVal) {
                    setState(() {
                      _areGlutenFree = newVal;
                    });
                  },
                  title: Text('Gluten-free'),
                  subtitle: Text(
                    'Include only gluten-free meals.',
                  ),
                ),
                SwitchListTile(
                  value: _areLactoseFree,
                  onChanged: (newVal) {
                    setState(() {
                      _areLactoseFree = newVal;
                    });
                  },
                  title: Text('Lactose-free'),
                  subtitle: Text(
                    'Include only lactose-free meals.',
                  ),
                ),
                SwitchListTile(
                  value: _areVegetarian,
                  onChanged: (newVal) {
                    setState(() {
                      _areVegetarian = newVal;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text(
                    'Include only vegetarian meals.',
                  ),
                ),
                SwitchListTile(
                  value: _areVegan,
                  onChanged: (newVal) {
                    setState(() {
                      _areVegan = newVal;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text(
                    'Include only vegan meals.',
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
