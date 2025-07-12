import 'package:food_playground/generated/json/base/json_field.dart';
import 'package:food_playground/generated/json/meal_model.g.dart';
import 'dart:convert';
export 'package:food_playground/generated/json/meal_model.g.dart';

@JsonSerializable()
class MealModel {
	String? id;
	List<String>? categories;
	String? title;
	int? affordability;
	int? complexity;
	String? imageUrl;
	int? duration;
	List<String>? ingredients;
	List<String>? steps;
	bool? isGlutenFree;
	bool? isVegan;
	bool? isVegetarian;
	bool? isLactoseFree;
	bool? isFavorite;

	MealModel();

	factory MealModel.fromJson(Map<String, dynamic> json) => $MealModelFromJson(json);

	Map<String, dynamic> toJson() => $MealModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}