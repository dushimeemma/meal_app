import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorates_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _index = 0;

  @override
  void initState() {
    _pages = [
      {'page': Categories(), 'title': 'Kigali Meals'},
      {'page': Favorites(widget.favoriteMeals), 'title': 'Favorites Meals'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_index]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
