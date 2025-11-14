import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Sałatka',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Colors.blueAccent,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Ciasteczka',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Colors.blueAccent,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Ciasto',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Colors.blueAccent,
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Ciasto',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Colors.blueAccent,
      ),
    );

    return categories;
  }
}
