import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView(
      controller: scrollController,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 40),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              id: category.id,
              title: category.title,
              color: category.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
