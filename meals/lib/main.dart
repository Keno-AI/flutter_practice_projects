import 'package:flutter/material.dart';
import './categories_screen.dart';
import './category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
            ) 
          )),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
      },
    );
  }
}