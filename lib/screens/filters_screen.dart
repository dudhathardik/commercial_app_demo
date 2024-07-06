import 'package:commercial_app/screens/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'FiltersScreen';

  final Function saveFilters;
  final Map<String, bool> currentFiltes;
  FiltersScreen(this.saveFilters, this.currentFiltes);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  initState() {
    if (widget.currentFiltes['gluten'] != null) {
      _glutenFree = widget.currentFiltes['gluten']!;
    }
    if (widget.currentFiltes['lactose'] != null) {
      _lactoseFree = widget.currentFiltes['lactose']!;
    }
    if (widget.currentFiltes['vegan'] != null) {
      _vegan = widget.currentFiltes['vegan']!;
    }
    if (widget.currentFiltes['vegetarian'] != null) {
      _vegetarian = widget.currentFiltes['vegetarian']!;
    }
    super.initState();
  }

  Widget _buildSwitchListTile(bool value, String title, String subtitle,
      void Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'varelaRound',
          color: Colors.black87,
          fontWeight: FontWeight.normal,
        ),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fliters',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  _glutenFree,
                  'Gluten-Free',
                  'Only include glute-free items',
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  _vegan,
                  'Vegan',
                  'Only include vegan items',
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  _vegetarian,
                  'Vegetarian',
                  'Only include vegetarian items',
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  _lactoseFree,
                  'LactoseFree',
                  'Only include lactose-free items',
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
