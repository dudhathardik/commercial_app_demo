//categoryitem reseve data here from dummy data

import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'DeliMeal',
      //     style: Theme.of(context).textTheme.titleLarge,
      //   ),
      // ),
      body: GridView(
        padding:
            const EdgeInsets.only(top: 13, left: 10, right: 10, bottom: 10),

        //all Dummy_categories data transfer to categoryitem
        //which means categoryitem collect data here from dummy_data
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
                catData.imageUrl,
              ),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
