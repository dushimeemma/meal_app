import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static String routeName = '/category-meals';
  final List<Meal> allMeals;

  CategoryMeals(this.allMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String title;
  List<Meal> filteredMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routesArgs['title'];
      final id = routesArgs['id'];
      filteredMeals = widget.allMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      filteredMeals.removeWhere((el) => el.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filteredMeals[index].id,
            title: filteredMeals[index].title,
            imageUrl: filteredMeals[index].imageUrl,
            duration: filteredMeals[index].duration,
            complexity: filteredMeals[index].complexity,
            affordability: filteredMeals[index].affordability,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
