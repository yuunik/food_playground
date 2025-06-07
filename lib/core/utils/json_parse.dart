import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/model/meal_model.dart';

class JsonParse {
  // 获取 categoryList
  static Future<List<CategoryModel>> getCategoryList() async {
    // 读取 jsonStr
    final String jsonStr =
        await rootBundle.loadString("assets/json/category.json");
    // 转换为 jsonMap
    final resultList = json.decode(jsonStr)['category'];
    List<CategoryModel> categoryList = [];
    for (var categoryJson in resultList) {
      // json => category
      categoryList.add(CategoryModel.fromJson(categoryJson));
    }
    return categoryList;
  }

  // 获取 mealList
  static Future<List<MealModel>> getMealList() async {
    // 读取 jsonStr
    final mealJsonStr = await rootBundle.loadString("assets/json/meal.json");
    // 获取 map
    final resultList = json.decode(mealJsonStr)['meal'];
    List<MealModel> mealList = [];
    for (var mealJson in resultList) {
      // json => meal
      mealList.add(MealModel.fromJson(mealJson));
    }
    return mealList;
  }
}
