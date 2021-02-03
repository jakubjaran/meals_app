import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final scrollController = ScrollController();

  var _loadedInitData = false;
  String title;
  String categoryId;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      var routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      title = routeArgs['title'];
      categoryId = routeArgs['id'];
      categoryMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMealHandler(id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: scrollController,
        title: Text(title),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index], removeMealHandler);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
