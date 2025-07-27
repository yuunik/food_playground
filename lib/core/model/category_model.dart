import 'package:flutter/material.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
  });

  final String id;
  final String title;
  final Color color;

  CategoryModel copyWith({
    String? id,
    String? title,
    Color? color,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      color: Color(int.parse('FF${json['color']}', radix: 16)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'color': color.value.toRadixString(16).substring(2).toUpperCase(),
    };
  }

  @override
  String toString() {
    return "CategoryModel(id: $id, title: $title, color: $color)";
  }
}