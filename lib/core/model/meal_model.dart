// To parse this JSON data, do
//
//     final mealModel = mealModelFromJson(jsonString);

import 'dart:convert';

MealModel mealModelFromJson(String str) => MealModel.fromJson(json.decode(str));

String mealModelToJson(MealModel data) => json.encode(data.toJson());

List<String> complexityList = ["Simple", "Normal", "Difficult"];

class MealModel {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String complexityStr;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isFavorite;

  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.complexityStr,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.isFavorite,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
    complexityStr: complexityList[json["complexity"]],
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoseFree: json["isLactoseFree"],
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "title": title,
    "affordability": affordability,
    "complexity": complexity,
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoseFree,
    "isFavorite": isFavorite,
  };

  @override
  String toString() {
    return 'MealModel{'
        'id: $id, '
        'title: $title, '
        'categories: $categories, '
        'affordability: $affordability, '
        'complexity: $complexity, '
        'imageUrl: $imageUrl, '
        'duration: $duration, '
        'ingredients: $ingredients, '
        'steps: $steps, '
        'isGlutenFree: $isGlutenFree, '
        'isVegan: $isVegan, '
        'isVegetarian: $isVegetarian, '
        'isLactoseFree: $isLactoseFree, '
        'isFavorite: $isFavorite'
        '}';
  }
}