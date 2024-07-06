import './categories_screen.dart';
import 'package:flutter/material.dart';
import './favorite_screen.dart';
import './main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritemeals;

  TabsScreen(this.favoritemeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //
  //
  late List<Map<String, Object>> _pages;
  int _selectIndexPage = 0;

  @override
  initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoritemeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectIndexPage = index;
      print(_selectIndexPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pages[_selectIndexPage]['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectIndexPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // backgroundColor: Colors.teal,
        unselectedFontSize: 14,
        selectedFontSize: 16,
        elevation: 10,
        unselectedItemColor: const Color.fromARGB(255, 172, 206, 192),
        selectedItemColor: Colors.white,
        currentIndex: _selectIndexPage,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
