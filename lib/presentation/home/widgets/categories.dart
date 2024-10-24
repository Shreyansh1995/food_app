import 'package:flutter/material.dart';
import 'package:food_app/data/models/category.dart';
import 'package:food_app/presentation/home/widgets/view_category.dart';

class Categories extends StatefulWidget {

  

  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Category> categories = [
    Category('Salad', false),
    Category('Pizza', false),
    Category('Beverage', true),
    Category('Snacks', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.08+ MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => ViewCategory(
          category: categories[index],
        ),
      ),
    );
  }
}