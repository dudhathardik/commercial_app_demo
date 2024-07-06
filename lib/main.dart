import 'package:commercial_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import '../screens/meal_deatil_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/category_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere(
      (meal) => meal.id == mealId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Kalam',
        primarySwatch: Colors.teal,
        secondaryHeaderColor: Colors.tealAccent,
        canvasColor: const Color.fromARGB(255, 202, 243, 234),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kalam',
                color: Color.fromRGBO(20, 51, 51, 1),
                // color: Colors.teal,
              ),
              //appbar text
              bodyMedium: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'VarelaRound',
                color: Color.fromARGB(255, 202, 243, 234),
              ),
              //used for below image text
              bodySmall: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'VarelaRound',
                color: Colors.black,
                // color: Colors.teal,
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 216, 235, 227),
              ),
              // title of the deatial page(ingredient and step)
              titleMedium: const TextStyle(
                fontSize: 25,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(20, 51, 51, 1),
                // color: Colors.teal,
              ),
              titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 20, 24, 24),
              ),
            ),
      ),
      home: null,
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
    );
  }
}
