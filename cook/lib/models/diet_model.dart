import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSeleceted;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSeleceted,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'easy',
        duration: '30mins',
        calorie: '180kcal',
        boxColor: Color(0xff9DCEFF),
        viewIsSeleceted: true,
      ),
    );
    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'easy',
        duration: '30mins',
        calorie: '180kcal',
        viewIsSeleceted: false,
        boxColor: Color(0xff9DCEFF),
      ),
    );
    diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'easy',
        duration: '30mins',
        calorie: '180kcal',
        viewIsSeleceted: true,
        boxColor: Color(0xff9DCEFF),
      ),
    );

    return diets;
  }
}
