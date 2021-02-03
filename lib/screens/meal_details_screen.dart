import 'package:flutter/material.dart';

import '../models/meal.dart';

class SectionTitle extends StatelessWidget {
  final String text;

  SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealData = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealData.id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 270,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SectionTitle('Ingredients'),
            Card(
              elevation: 4,
              color: Color.fromRGBO(255, 255, 136, 1),
              margin: EdgeInsets.all(20),
              child: Container(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        title: Text(
                          mealData.ingredients[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  itemCount: mealData.ingredients.length,
                ),
              ),
            ),
            SectionTitle('Steps'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: List.generate(
                  mealData.steps.length,
                  (index) => ListTile(
                    title: Text(
                      mealData.steps[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text("#${index + 1}"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
