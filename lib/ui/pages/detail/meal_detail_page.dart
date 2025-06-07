import 'package:flutter/material.dart';
import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/ui/pages/detail/meal_detail_content_page.dart';

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
      body: MealDetailContentPage(meal: _meal),
      floatingActionButton:  FloatingActionButton(
        child: const Icon(Icons.favorite_border),
        onPressed: () {},
      ),
    );
  }
}
