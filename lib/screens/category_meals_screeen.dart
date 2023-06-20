import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';
   
  final List<Meal> filteredMeals;
  CategoryMealsScreen(this.filteredMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;
  @override
  void initState() {
    // ...
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.filteredMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                displayedMeals![index].title,
                displayedMeals![index].id,
                displayedMeals![index].imageUrl,
                displayedMeals![index].duration,
                displayedMeals![index].complexity,
                displayedMeals![index].affordability,
                
            );
          },
          itemCount: displayedMeals!.length,
        ));
  }
}
