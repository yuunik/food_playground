import 'package:flutter/material.dart';
import 'package:food_playground/core/model/category_model.dart';

class MealPage extends StatelessWidget {
  static const routeName = "/mealList";

  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    print(category);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Text("content"),
    );
  }
}
