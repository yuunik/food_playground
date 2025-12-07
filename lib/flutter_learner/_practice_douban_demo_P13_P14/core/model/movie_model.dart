import 'package:food_playground/generated/json/base/json_field.dart';
import 'package:food_playground/generated/json/movie_model.g.dart';
import 'dart:convert';
export 'package:food_playground/generated/json/movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  List<MovieData>? data;
  int? createdAt;
  int? updatedAt;
  String? id;
  String? originalName;
  int? imdbVotes;
  String? imdbRating;
  String? rottenRating;
  int? rottenVotes;
  String? year;
  String? imdbId;
  String? alias;
  String? doubanId;
  String? type;
  String? doubanRating;
  int? doubanVotes;
  int? duration;
  String? dateReleased;

  MovieModel();

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      $MovieModelFromJson(json);

  Map<String, dynamic> toJson() => $MovieModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MovieData {
  int? createdAt;
  int? updatedAt;
  String? id;
  String? poster;
  String? name;
  String? genre;
  String? description;
  String? language;
  String? country;
  String? lang;
  String? shareImage;
  String? movie;

  MovieData();

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      $MovieDataFromJson(json);

  Map<String, dynamic> toJson() => $MovieDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
