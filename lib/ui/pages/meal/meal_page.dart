import 'package:flutter/material.dart';
import 'package:food_playground/core/model/category_model.dart';

class MealPage extends StatelessWidget {
  static const routeName = "/mealList";

  const MealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel?;
    
    // 如果category为null，显示错误页面
    if (category == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text(
            "No category data found",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    print(category);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: const Text("content"),
    );
  }
}
