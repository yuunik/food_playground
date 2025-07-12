import 'package:food_playground/generated/json/base/json_convert_content.dart';
import 'package:food_playground/core/model/category_model.dart';

CategoryModel $CategoryModelFromJson(Map<String, dynamic> json) {
  final CategoryModel categoryModel = CategoryModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    categoryModel.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    categoryModel.title = title;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    categoryModel.color = color;
  }
  return categoryModel;
}

Map<String, dynamic> $CategoryModelToJson(CategoryModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['color'] = entity.color;
  return data;
}

extension CategoryModelExtension on CategoryModel {
  CategoryModel copyWith({
    String? id,
    String? title,
    String? color,
  }) {
    return CategoryModel()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..color = color ?? this.color;
  }
}