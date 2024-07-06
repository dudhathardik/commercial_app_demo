// Here in this screen i made theme and functioning fo title and color for box
// title for box title (food item name)
//
//category_item catch data from category ewhich is in Categories_screen
//
// and also this pade push page category_item to category_meal_screen
// when we click on food category
//
//category_meal_screen reseve data about food from here
//

import '../screens/category_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.imageUrl,
  );

// categoryMealScreem collect data here from categoryitem
//
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.network(
              imageUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 17,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              color: Colors.black54,
              // width: 120,
              child: Text(
                title,
                // style: Theme.of(context).textTheme.titleLarge,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




          // padding: const EdgeInsets.all(30),
          // child: Container(
          //   height: 10,

          //   color: Colors.black54,
          //   child: Text(
          //     title,
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),




          // decoration: BoxDecoration(
          //   // gradient: LinearGradient(
          //   //   colors: [
          //   //     color.withOpacity(0.6),
          //   //     color,
          //   //   ],
          //   //   begin: Alignment.topLeft,
          //   //   end: Alignment.bottomRight,
          //   // ),
          //   image: DecorationImage(
          //     image: NetworkImage(imageUrl),
          //     fit: BoxFit.cover,
          //   ),
          // borderRadius: BorderRadius.circular(20),



//  child: Stack(
//         children: [
//           ClipRRect(
//             // borderRadius: const BorderRadius.only(
//             //   topLeft: Radius.circular(1),
//             //   topRight: Radius.circular(1),
//             // ),

//             child: Image.network(
//               imageUrl,

//               // width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             bottom: 2,
//             right: 2,
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
//               color: Colors.black54,
//               width: 100,
//               child: Text(
//                 title,
//                 style: Theme.of(context).textTheme.titleSmall,
//                 softWrap: true,
//                 overflow: TextOverflow.fade,
//               ),
//             ),
//           )
//         ],
//       ),


// 