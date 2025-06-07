import 'package:flutter/material.dart';
import 'package:food_playground/core/utils/json_parse.dart';
import 'package:get/get.dart';

import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/viewmodel/meal_view_model.dart';
import 'package:food_playground/ui/widgets/meal_card.dart';
import 'package:food_playground/core/model/category_model.dart';

class MealContentWidget extends StatefulWidget {
  const MealContentWidget({super.key});

  @override
  State<MealContentWidget> createState() => _MealContentWidgetState();
}

class _MealContentWidgetState extends State<MealContentWidget> {
  late MealViewModel mealStore;

  @override
  void initState() {
    super.initState();
    mealStore = Get.put(MealViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final category =
          ModalRoute.of(context)!.settings.arguments as CategoryModel;

      if (mealStore.isLoading.value) {
        // 加载状态
        return const Center(child: CircularProgressIndicator());
      }

      // 网络错误
      if (mealStore.mealList.isEmpty) {
        return FutureBuilder(
            future: JsonParse.getMealList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("读取失败...."));
              }

              if (!snapshot.hasData) {
                // loading
                return const Center(child: CircularProgressIndicator());
              }
              // 获取数据
              final mealList = snapshot.data!;
              return ListView.builder(
                  itemCount: mealList.length,
                  itemBuilder: (context, index) {
                    return MealCard(mealList[index]);
                  });
            });
      }

      // 网络请求成功
      // final mealStore = Get.put(MealViewModel());
      List<MealModel> mealList = mealStore.mealList
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      return ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (context, index) {
            return MealCard(mealList[index]);
          });
    });
  }
}
