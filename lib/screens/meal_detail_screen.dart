import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/mealDetail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,

      height: 180,
      width: 280,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    //must practice .firstwhere()
    /* example:
    const jacketColor = ['red','orange','green','blue','velvet'];
  String red = jacketColor.firstWhere((jacket)=> jacket == 'red');
  print(red); */

    /**Example #2:
  enum Size {
    exSmall,
    small,
    large,
    exLarge,
    obesity
  }

class Jacket {
  final Size size;
  final String name;
  Jacket({ @required this.size, @required this.name});
}

List <Jacket> jackets = [
  Jacket(size: Size.exLarge ,name: 'moises'  ),
  Jacket(size: Size.obesity,name: 'moises'    ),
  Jacket(size: Size.exSmall, name: 'moises'   ),
  Jacket(size: Size.small,name: 'Joseph'),  
  Jacket(size: Size.small, name: 'moises'    ),
  Jacket(size: Size.small,  name: 'moises'     ),
  Jacket(size: Size.small,  name: 'moises'   ),
    


];
//inside main:
  var myName = jackets.firstWhere((jacket)=> jacket.size == Size.small).name; 
  print(myName);
   */
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageURL,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Text(selectedMeal.ingredients[index]),
                );
              },
            )),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(selectedMeal.steps[index]),
                leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                ),
              ),
            )),
            Padding(padding: EdgeInsets.all(4))
          ],
        ),
      ),
    );
  }
}
