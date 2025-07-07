import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_playground/core/model/category_model.dart';

class JsonParseUtil {
  static Future<List<CategoryModel>> getCategoryList() async {
    // read string
    final jsonStr = await rootBundle.loadString("assets/json/category.json");
    final jsonMap = json.decode(jsonStr);

    final categoryMapList = jsonMap['category'];
    List<CategoryModel> categoryList = [];
    for (var categoryMap in categoryMapList) {
      categoryList.add(CategoryModel.fromJson(categoryMap));
    }
    print("执行完成");
    return categoryList;
  }
}