import 'package:flutter/material.dart';
import 'package:mealsApp/dummy_data.dart';
import 'package:mealsApp/screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import './models/meal.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
// import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      //so if it exists, you toggle remove it
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else
      setState(() {
        //if it doesn't exist, you toggle add
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
// .any() Checks whether any element of this iterable satisfies [test].
// Checks every element in iteration order, and returns true if any of them make [test] return true, otherwise returns false.
  }

  @override
  Widget build(BuildContext context) {
    print(_favoritedMeals);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'DeliMeals',
      theme: ThemeData(
        accentColor: Colors.red,
        primarySwatch: Colors.orange,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              /*body1 deprecated */ bodyText2:
                  TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              /*body2: deprecated*/ bodyText1:
                  TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              /* title:*/ headline6: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: TabsScreen(_favoritedMeals),
      home: TabsScreen(_favoritedMeals),
      routes: {
        CategoryMealsScreen.route: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.route: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.route: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              filters: _filters,
            ),
      },
      //onGenerateRoute is helpful for other apps
      //onUnknownRoute is your 404 for mobile basically
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
