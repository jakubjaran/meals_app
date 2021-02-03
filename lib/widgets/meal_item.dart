import 'package:flutter/material.dart';

import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class InfoRowItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool spacing;

  InfoRowItem(this.text, this.icon, {this.spacing = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          width: spacing ? 6 : 0,
        ),
        Text(
          '$text',
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}

class MealItem extends StatelessWidget {
  final Meal mealData;

  final Function removeMealHandler;

  MealItem(this.mealData, this.removeMealHandler);

  String get complexityText {
    switch (mealData.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (mealData.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailsScreen.routeName, arguments: mealData)
        .then((result) {
      if (result != null) {
        removeMealHandler(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealData.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.black54,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Text(
                      mealData.title,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoRowItem(
                    '${mealData.duration} min',
                    Icons.schedule,
                  ),
                  InfoRowItem(
                    '$complexityText',
                    Icons.work_outline,
                  ),
                  InfoRowItem(
                    '$affordabilityText',
                    Icons.attach_money,
                    spacing: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
