import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.length == 0) {
      return Center(
        child: Text('There is no favorite meals. Start adding some!'),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(favoriteMeals[index]);
              },
              itemCount: favoriteMeals.length,
            ),
          ),
        ],
      );
    }
  }
}
