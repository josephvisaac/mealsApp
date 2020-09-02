import 'package:flutter/material.dart';
import 'package:mealsApp/screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'package:mealsApp/screens/category_meals_screen.dart';
// import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.pink,
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
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.route: (ctx) => MealDetailScreen(),
        FiltersScreen.route: (ctx) => FiltersScreen(),
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
