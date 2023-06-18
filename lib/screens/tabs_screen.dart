import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TebsScreen extends StatefulWidget {
  const TebsScreen({super.key});

  @override
  State<TebsScreen> createState() => _TebsScreenState();
}

class _TebsScreenState extends State<TebsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meals',
          ),
          bottom: const TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.category), text: 'Categories'),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ]),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}
