import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/core/service/http_request.dart';

class MealRequest {
  Future<List<MealModel>> getMealList() async {
    final res = await HttpRequest.send("/getCategoryList");
    final dataListStr = res["meal"];
    List<MealModel> mealList = [];
    for (var data in dataListStr) {
      mealList.add(MealModel.fromJson(data));
    }
    return mealList;
  }
}