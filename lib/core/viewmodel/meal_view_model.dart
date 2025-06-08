import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/service/meal_request.dart';
import 'package:get/get.dart';

class MealViewModel extends GetxController {
  List<MealModel> mealList = <MealModel>[].obs;
  // 加载状态
  var isLoading = true.obs;

  MealViewModel() {
    getMealList();
  }

  // 获取菜单列表
  getMealList() async {
    // 开始加载
    isLoading.value = true;
    try {
      final res = await MealRequest.getMealList();
      mealList = res;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}