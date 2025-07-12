import 'package:food_playground/generated/json/base/json_convert_content.dart';
import 'package:food_playground/core/model/meal_model.dart';

MealModel $MealModelFromJson(Map<String, dynamic> json) {
  final MealModel mealModel = MealModel();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    mealModel.id = id;
  }
  final List<String>? categories = (json['categories'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (categories != null) {
    mealModel.categories = categories;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    mealModel.title = title;
  }
  final int? affordability = jsonConvert.convert<int>(json['affordability']);
  if (affordability != null) {
    mealModel.affordability = affordability;
  }
  final int? complexity = jsonConvert.convert<int>(json['complexity']);
  if (complexity != null) {
    mealModel.complexity = complexity;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    mealModel.imageUrl = imageUrl;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    mealModel.duration = duration;
  }
  final List<String>? ingredients = (json['ingredients'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (ingredients != null) {
    mealModel.ingredients = ingredients;
  }
  final List<String>? steps = (json['steps'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (steps != null) {
    mealModel.steps = steps;
  }
  final bool? isGlutenFree = jsonConvert.convert<bool>(json['isGlutenFree']);
  if (isGlutenFree != null) {
    mealModel.isGlutenFree = isGlutenFree;
  }
  final bool? isVegan = jsonConvert.convert<bool>(json['isVegan']);
  if (isVegan != null) {
    mealModel.isVegan = isVegan;
  }
  final bool? isVegetarian = jsonConvert.convert<bool>(json['isVegetarian']);
  if (isVegetarian != null) {
    mealModel.isVegetarian = isVegetarian;
  }
  final bool? isLactoseFree = jsonConvert.convert<bool>(json['isLactoseFree']);
  if (isLactoseFree != null) {
    mealModel.isLactoseFree = isLactoseFree;
  }
  final bool? isFavorite = jsonConvert.convert<bool>(json['isFavorite']);
  if (isFavorite != null) {
    mealModel.isFavorite = isFavorite;
  }
  return mealModel;
}

Map<String, dynamic> $MealModelToJson(MealModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['categories'] = entity.categories;
  data['title'] = entity.title;
  data['affordability'] = entity.affordability;
  data['complexity'] = entity.complexity;
  data['imageUrl'] = entity.imageUrl;
  data['duration'] = entity.duration;
  data['ingredients'] = entity.ingredients;
  data['steps'] = entity.steps;
  data['isGlutenFree'] = entity.isGlutenFree;
  data['isVegan'] = entity.isVegan;
  data['isVegetarian'] = entity.isVegetarian;
  data['isLactoseFree'] = entity.isLactoseFree;
  data['isFavorite'] = entity.isFavorite;
  return data;
}

extension MealModelExtension on MealModel {
  MealModel copyWith({
    String? id,
    List<String>? categories,
    String? title,
    int? affordability,
    int? complexity,
    String? imageUrl,
    int? duration,
    List<String>? ingredients,
    List<String>? steps,
    bool? isGlutenFree,
    bool? isVegan,
    bool? isVegetarian,
    bool? isLactoseFree,
    bool? isFavorite,
  }) {
    return MealModel()
      ..id = id ?? this.id
      ..categories = categories ?? this.categories
      ..title = title ?? this.title
      ..affordability = affordability ?? this.affordability
      ..complexity = complexity ?? this.complexity
      ..imageUrl = imageUrl ?? this.imageUrl
      ..duration = duration ?? this.duration
      ..ingredients = ingredients ?? this.ingredients
      ..steps = steps ?? this.steps
      ..isGlutenFree = isGlutenFree ?? this.isGlutenFree
      ..isVegan = isVegan ?? this.isVegan
      ..isVegetarian = isVegetarian ?? this.isVegetarian
      ..isLactoseFree = isLactoseFree ?? this.isLactoseFree
      ..isFavorite = isFavorite ?? this.isFavorite;
  }
}