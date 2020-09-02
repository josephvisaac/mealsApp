import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
 const Category({
    this.color = Colors.orange,
    @required this.title,
    @required this.id,
  }); //this is how you provide default values for names arguments in case no argument is provided( the color value)
}
