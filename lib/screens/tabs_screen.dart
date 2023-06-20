import 'package:flutter/material.dart';


import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TebsScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeals;
  TebsScreen(this.favoriteMeals);

  @override
  State<TebsScreen> createState() => _TebsScreenState();
}

class _TebsScreenState extends State<TebsScreen> {
  late List<Map<String, dynamic>> _pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Your Favorites', 'page': FavoritesScreen(widget.favoriteMeals)}
  ];
    
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
          _pages[selectedPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).canvasColor,
          selectedItemColor: Colors.black,
          currentIndex: selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: 'Favorites'),
          ]),
    );
  }
}
// bottom: const TabBar(tabs: <Widget>[
//           Tab(icon: Icon(Icons.category), text: 'Categories'),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'Favorites',
//           )
//         ]),
//       ),
//       body: TabBarView(
//         children: [CategoriesScreen(), FavoritesScreen()],
//       ),