import 'package:flutter/material.dart';
import './main_drawer.dart';
class FiltersScreen extends StatelessWidget {
  static const route = '/filtersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Center(
      child: Text('Filters!'),
    ),
    );
  }
}
