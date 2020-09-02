import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
// import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = '/selectedCategory';
  /*final String categoryID;
  final String categoryTITLE;
  CategoryMealsScreen({this.categoryID, this.categoryTITLE});*/
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    String id = arguments['id'], title = arguments['title'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
    // print(arguments);
    print(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageURL,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
      ),
    );
  }
}
