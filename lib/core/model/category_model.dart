import 'package:food_playground/generated/json/base/json_field.dart';
import 'package:food_playground/generated/json/category_model.g.dart';
import 'dart:convert';
export 'package:food_playground/generated/json/category_model.g.dart';

@JsonSerializable()
class CategoryModel {
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

	CategoryModel();

	factory CategoryModel.fromJson(Map<String, dynamic> json) => $CategoryModelFromJson(json);

	Map<String, dynamic> toJson() => $CategoryModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}