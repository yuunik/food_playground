import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/service/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealList() async {
    final res = await HttpRequest.send("/meal");
    // 获取 map
    final resList = res['meal'];
    List<MealModel> mealList = [];
    // 遍历
    for (var meal in resList) {
      mealList.add(MealModel.fromJson(meal));
    }
    return mealList;
  }
}