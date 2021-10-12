import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MaealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final thisMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
        appBar: AppBar(title: Text(thisMeal.title)),
        floatingActionButton: FloatingActionButton(onPressed: (){
                Navigator.of(context).pop(mealId);
              }, child: Icon(Icons.delete),backgroundColor: Colors.red,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: Card(
                  elevation: 6,
                  margin: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.network(
                    thisMeal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber,
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          thisMeal.ingredients[index],
                          textAlign: TextAlign.center,
                        ));
                  },
                  itemCount: thisMeal.ingredients.length,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 30,
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(thisMeal.steps[index]),
                    );
                  },
                  itemCount: thisMeal.steps.length,
                ),
              ),
              
              
            ],
            
          ),
          
        ));
  }
}
