import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
 final  List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
      child: Text('No Favourites Yet'),
    );
    }else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                favouriteMeals[index].id,
                favouriteMeals[index].imageUrl,
                favouriteMeals[index].title,
                 favouriteMeals[index].duration,
                favouriteMeals[index].complexity,
                favouriteMeals[index].affordability
            );
          },
          itemCount: favouriteMeals.length,
        );
    }
    
  }
}