import 'package:flutter/material.dart';


import './screens/meal_detail_screen.dart';
import './screens/category_meals_screeen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headlineLarge: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(), //home
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(),
        // MealDetailScreen.routName: (ctx) => MealDetailScreen(),

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
