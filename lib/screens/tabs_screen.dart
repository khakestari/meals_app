import 'package:flutter/material.dart';


import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TebsScreen extends StatefulWidget {
  const TebsScreen({super.key});

  @override
  State<TebsScreen> createState() => _TebsScreenState();
}

class _TebsScreenState extends State<TebsScreen> {
final List<Map<String, dynamic>> _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
    {'title': 'Your Favorites', 'page': FavoritesScreen()}
  ];
  int selectedPageIndex = 0;
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