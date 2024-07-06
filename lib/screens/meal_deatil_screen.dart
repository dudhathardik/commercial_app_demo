import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function _isFavorite;
  MealDetailScreen(this.toggleFavorite, this._isFavorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final meal =
    //     ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // final mealId = meal['id'];
    // i can also write here indteed of above maping
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    // print('mealId ${mealId}');
    //here i used selectedMeal to save all the data of DUMMY_MEALS and also
    //compare here to give selected mealId value.

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      // print(meal.id);
      return meal.id == mealId;
    });
    // print('selectedID ${selectedMeal.id}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   // height: MediaQuery.of(context).size.height * 0.3,
          //   width: double.infinity,
          //   child: Image.network(
          //     selectedMeal.imageUrl,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Stack(
            children: [
              ClipRRect(
                child: Image.network(
                  selectedMeal.imageUrl,
                  // height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.black54,
                  // width: MediaQuery.of(context).size.width,
                  child: Text(
                    selectedMeal.title,
                    // style: Theme.of(context).textTheme.titleSmall,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildSectionTitle(context, 'Ingredients'),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: ListView.builder(
                        itemCount: selectedMeal.ingredients.length,
                        itemBuilder: (ctx, index) => Card(
                          color: const Color.fromARGB(255, 242, 250, 249),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              selectedMeal.ingredients[index],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                    endIndent: 30,
                    indent: 30,
                  ),
                  buildSectionTitle(context, 'Steps'),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      // padding: const EdgeInsets.only(left: 8, right: 8),
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: ListView.builder(
                        itemCount: selectedMeal.steps.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.teal,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Card(
                              color: const Color.fromARGB(255, 242, 250, 249),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  selectedMeal.steps[index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: 100,
                      height: 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          _isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


// data collect map
// ...selectedMeal.steps.map((e) {
//             return Padding(
//               padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
//               child: Text(
//                 '- ' '$e',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             );
//           }),
//           const Divider(height: 200, color: Colors.black),
//           ...selectedMeal.ingredients.map((i) {
//             return Padding(
//               padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
//               child: Text(
//                 i,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             );
//           })