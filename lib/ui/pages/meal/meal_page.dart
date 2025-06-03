import 'package:flutter/material.dart';

import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/ui/pages/meal/meal_content_widget.dart';

class MealPage extends StatelessWidget {
  static const String routeName = "/mealList";

  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title}"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1)
      ),
      body: const MealContentWidget()
    );
  }
}
