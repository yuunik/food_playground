import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/viewmodel/meal_view_model.dart';
import 'package:food_playground/ui/widgets/meal_card.dart';
import 'package:food_playground/core/model/category_model.dart';

class MealContentWidget extends StatelessWidget {
  const MealContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final mealStore = Get.put(MealViewModel());
    List<MealModel> mealList = mealStore.mealList
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          return MealCard(mealList[index]);
        });
  }
}
