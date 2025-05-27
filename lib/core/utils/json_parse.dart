import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:food_playground/core/model/CateogryModel.dart';

class JsonParse {
  // 获取 categoryList
  static Future<List<CategoryModel>> getCategoryList() async {
    // 读取 jsonStr
    final String jsonStr = await rootBundle.loadString("assets/json/category.json");
    // 转换为 jsonMap
    final resultList = json.decode(jsonStr)['category'];
    List<CategoryModel> categoryList = [];
    for (var categoryJson in resultList) {
      // json => category
      categoryList.add(CategoryModel.fromJson(categoryJson));
    }
    return categoryList;
  }
}