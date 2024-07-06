import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String text, Function flowHendler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontFamily: 'varelaRound',
        ),
      ),
      onTap: () => flowHendler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.infinity,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                color: Color.fromARGB(255, 216, 235, 227),
                fontSize: 25,
              ),
            ),
            alignment: Alignment.centerLeft,
            color: const Color.fromARGB(255, 90, 189, 179),
          ),
          buildListTile(Icons.restaurant, 'Restaurant', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'Setting', () {
            Navigator.of(context).pushReplacementNamed('FiltersScreen');
          }),
        ],
      ),
    );
  }
}
