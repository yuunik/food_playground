import 'package:flutter/material.dart';
import 'package:food_playground/core/viewmodel/meal_view_model.dart';
import 'package:get/get.dart';

import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/ui/pages/detail/meal_detail_content_page.dart';

class MealDetailPage extends StatelessWidget {
  // route name
  static const String routeName = "/detail";

  const MealDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1),
      ),
      body: MealDetailContentPage(meal: meal),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          meal.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: meal.isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          final mealStore = Get.find<MealViewModel>();
          final findItem = mealStore.mealList.firstWhere((element) => element.id == meal.id);
          findItem.isFavorite = true;
        },
      )
      // Obx(() {
      //   return FloatingActionButton(
      //     child: Icon(
      //       meal.isFavorite ? Icons.favorite : Icons.favorite_border,
      //       color: meal.isFavorite ? Colors.red : Colors.grey,
      //     ),
      //     onPressed: () {
      //       final mealStore = Get.find<MealViewModel>();
      //       final findItem = mealStore.mealList.firstWhere((element) => element.id == meal.id);
      //       findItem.isFavorite = true;
      //     },
      //   );
      // })
    );
  }
}
