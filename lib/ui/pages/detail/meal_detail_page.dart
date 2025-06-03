import 'package:flutter/material.dart';
import 'package:food_playground/core/model/meal_model.dart';

class MealDetailPage extends StatelessWidget {
  // route name
  static const String routeName = "/detail";

  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1),
      ),
      body: Center(
        child: Text("${_meal.title} Info"),
      ),
    );
  }
}
