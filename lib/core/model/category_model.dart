import 'dart:convert';
import 'dart:ui';

class CategoryModel {
  String? id;
  String? title;
  Color? color;

  CategoryModel({this.id, this.title, this.color});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    final int colorHex = int.parse(json['color'], radix: 16);
    color = Color(colorHex | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = json.encode(color);
    return data;
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, title: $title, color: $color}';
  }
}