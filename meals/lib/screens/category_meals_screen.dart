import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
// import '../models/category.dart';
// import '../models/meal.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> filteredMeals;

  // void removeMeal (String mealId){
  //   setState(() {
  //     filteredMeals.removeWhere((meal) => mealId == meal.id);
  //   });
    
  // }

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    filteredMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                filteredMeals[index].id,
                filteredMeals[index].imageUrl,
                filteredMeals[index].title,
                 filteredMeals[index].duration,
                filteredMeals[index].complexity,
                filteredMeals[index].affordability
            );
          },
          itemCount: filteredMeals.length,
        ),
      ),
    );
  }
}
