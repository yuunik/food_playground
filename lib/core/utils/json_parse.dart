import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/model/meal_model.dart';

class JsonParseUtil {
  // 本地读取 category 文件数据
  static Future<List<CategoryModel>> getCategoryList() async {
    // read string
    final jsonStr = await rootBundle.loadString("assets/json/category.json");
    final jsonMap = json.decode(jsonStr);

    final categoryMapList = jsonMap['category'];
    List<CategoryModel> categoryList = [];
    for (var categoryMap in categoryMapList) {
      categoryList.add(CategoryModel.fromJson(categoryMap));
    }
    return categoryList;
  }

  // 本地读取 meal 文件数据
  static Future<List<MealModel>> getMealList() async {
    // 读取 json 字符串
    final jsonStr = await rootBundle.loadString("assets/json/category.json");
    // 解析 json 字符串 为 map
    final dataMap = json.decode(jsonStr);
    // 获取 mealList, 做转换?
    final dataList = dataMap['meal'];
    List<MealModel> mealList = [];
    // 获取 mealList
    for (var data in dataList) {
      mealList.add(MealModel.fromJson(data));
    }
    return mealList;
  }
}
