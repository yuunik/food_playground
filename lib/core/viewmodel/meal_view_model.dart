import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/service/meal_request.dart';
import 'package:get/get.dart';

class MealViewModel extends GetxController {
  List<MealModel> mealList = [];

  MealViewModel() {
    getMealList();
  }

  // 获取菜单列表
  getMealList() async {
    final res = await MealRequest.getMealList();
    mealList = res;
  }
}