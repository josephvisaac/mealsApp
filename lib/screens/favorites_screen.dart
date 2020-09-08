import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // @override
  // void initState() {
  //   if (widget.favoriteMeals.isEmpty) {
  //     print('it\'s empty');
  //   } else
  //     print('it\'s not empty');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print('favorites tab');
    if (widget.favoriteMeals.isEmpty) {
      // print('it\'s empty');
      return Container(
        alignment: Alignment.center,
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      // print('it\'s not empty');
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageURL,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
      );
    }
  }
}
