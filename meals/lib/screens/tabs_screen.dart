import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Favourites'},
  ];

  int selectedPage = 0;

  void selectPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}



// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(
//               tabs: <Widget>[
//                 Tab(icon: Icon(Icons.category),text: 'Categories',),
//                 Tab(icon: Icon(Icons.star),text: 'Favourites',),
//               ],
//             ),
//           ),
//           body: TabBarView(children: [
//             CategoriesScreen(),
//             FavouritesScreen(),
//           ],),
//         ));
