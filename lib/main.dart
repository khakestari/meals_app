import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screeen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };


  List<Meal> _filteredMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];


  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      // print(_filteredMeals);
    });

  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    }
    setState(() {
      _favoritedMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headlineLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TebsScreen(_favoritedMeals), //home
        CategoryMealsScreen.routName: (ctx) =>
            CategoryMealsScreen(_filteredMeals),
        MealDetailScreen.routName: (ctx) =>
            MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FiltersScreen.routName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // routs which is not write above here
      //                                    ///
      // onGenerateRoute: (setting) {
      //   print(setting.arguments);
      //   if(setting.name == '/meal-detail'){
      //     return ...;
      //   }else if(setting.name == '/somthing-else'){
      //     return ...;
      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // fallback
      // onUnknownRoute: (settings) => {
      //   return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
