import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;

  var isVegan = false;

  var isVegetarian = false;

  var isLactoseFree = false;


  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten'];
    isVegan = widget.currentFilters['lactose'];
    isVegetarian = widget.currentFilters['vegan'];
    isLactoseFree = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters Page'),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> filtersData = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian
              };
              widget.saveFilters(filtersData);
            },
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[50],
            height: 50,
            child: Text('Adjust the filters:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ephesis',
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: isGlutenFree,
                subtitle: Text('Filter food with gluten free'),
                title: Text('Gluten Free'),
                onChanged: (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: isLactoseFree,
                subtitle: Text('Filter food with lactose free'),
                title: Text('Lactose Free'),
                onChanged: (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: isVegan,
                subtitle: Text('Filter food only for Vegan'),
                title: Text('Vagan Food'),
                onChanged: (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: isVegetarian,
                subtitle: Text('Filter food only for Vegetarian'),
                title: Text('Vegetarian Food'),
                onChanged: (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
