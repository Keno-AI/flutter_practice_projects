import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Time!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Ephesis',
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  
                  ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                  fontFamily: 'Ephesis',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                  fontFamily: 'Ephesis',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
