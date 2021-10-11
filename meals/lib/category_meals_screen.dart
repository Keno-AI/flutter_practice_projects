import 'package:flutter/material.dart';
// import '../models/category.dart';
// import '../models/meal.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title:  Text(categoryTitle),),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx,index) {
          return Text(filteredMeals[index].title);
        },itemCount: filteredMeals.length,),
      ),
    );
  }
}