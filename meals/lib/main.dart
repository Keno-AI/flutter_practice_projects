import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void saveFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void selectFavourite(String mealId) {
    int alreadyFavourite =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (alreadyFavourite > -1) {
      favouriteMeals.removeWhere((meal) => meal.id == mealId);
      print(favouriteMeals);
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
      print(favouriteMeals);
    }
  }

  bool isFavourite (String mealId){
    return favouriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
      home: TabsScreen(favouriteMeals),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MaealDetailScreen.routeName: (context) =>
            MaealDetailScreen(selectFavourite,isFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters, saveFilters),
      },
    );
  }
}
