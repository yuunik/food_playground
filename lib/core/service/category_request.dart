import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/service/http_request.dart';

class CategoryRequest {
  static Future<List<CategoryModel>> getCategoryList() async {
    // 发送请求
    final res = await HttpRequest.send("/category");
    final resList = res['category'];
    List<CategoryModel> categoryList = [];
    for (var category in resList) {
      categoryList.add(CategoryModel.fromJson(category));
    }
    return categoryList;
  }
}