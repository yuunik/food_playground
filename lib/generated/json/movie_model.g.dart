import 'package:food_playground/generated/json/base/json_convert_content.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/core/model/movie_model.dart';

MovieModel $MovieModelFromJson(Map<String, dynamic> json) {
  final MovieModel movieModel = MovieModel();
  final List<MovieData>? data = (json['data'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<MovieData>(e) as MovieData)
      .toList();
  if (data != null) {
    movieModel.data = data;
  }
  final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
  if (createdAt != null) {
    movieModel.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updatedAt']);
  if (updatedAt != null) {
    movieModel.updatedAt = updatedAt;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    movieModel.id = id;
  }
  final String? originalName = jsonConvert.convert<String>(
    json['originalName'],
  );
  if (originalName != null) {
    movieModel.originalName = originalName;
  }
  final int? imdbVotes = jsonConvert.convert<int>(json['imdbVotes']);
  if (imdbVotes != null) {
    movieModel.imdbVotes = imdbVotes;
  }
  final String? imdbRating = jsonConvert.convert<String>(json['imdbRating']);
  if (imdbRating != null) {
    movieModel.imdbRating = imdbRating;
  }
  final String? rottenRating = jsonConvert.convert<String>(
    json['rottenRating'],
  );
  if (rottenRating != null) {
    movieModel.rottenRating = rottenRating;
  }
  final int? rottenVotes = jsonConvert.convert<int>(json['rottenVotes']);
  if (rottenVotes != null) {
    movieModel.rottenVotes = rottenVotes;
  }
  final String? year = jsonConvert.convert<String>(json['year']);
  if (year != null) {
    movieModel.year = year;
  }
  final String? imdbId = jsonConvert.convert<String>(json['imdbId']);
  if (imdbId != null) {
    movieModel.imdbId = imdbId;
  }
  final String? alias = jsonConvert.convert<String>(json['alias']);
  if (alias != null) {
    movieModel.alias = alias;
  }
  final String? doubanId = jsonConvert.convert<String>(json['doubanId']);
  if (doubanId != null) {
    movieModel.doubanId = doubanId;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    movieModel.type = type;
  }
  final String? doubanRating = jsonConvert.convert<String>(
    json['doubanRating'],
  );
  if (doubanRating != null) {
    movieModel.doubanRating = doubanRating;
  }
  final int? doubanVotes = jsonConvert.convert<int>(json['doubanVotes']);
  if (doubanVotes != null) {
    movieModel.doubanVotes = doubanVotes;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    movieModel.duration = duration;
  }
  final String? dateReleased = jsonConvert.convert<String>(
    json['dateReleased'],
  );
  if (dateReleased != null) {
    movieModel.dateReleased = dateReleased;
  }
  return movieModel;
}

Map<String, dynamic> $MovieModelToJson(MovieModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['id'] = entity.id;
  data['originalName'] = entity.originalName;
  data['imdbVotes'] = entity.imdbVotes;
  data['imdbRating'] = entity.imdbRating;
  data['rottenRating'] = entity.rottenRating;
  data['rottenVotes'] = entity.rottenVotes;
  data['year'] = entity.year;
  data['imdbId'] = entity.imdbId;
  data['alias'] = entity.alias;
  data['doubanId'] = entity.doubanId;
  data['type'] = entity.type;
  data['doubanRating'] = entity.doubanRating;
  data['doubanVotes'] = entity.doubanVotes;
  data['duration'] = entity.duration;
  data['dateReleased'] = entity.dateReleased;
  return data;
}

extension MovieModelExtension on MovieModel {
  MovieModel copyWith({
    List<MovieData>? data,
    int? createdAt,
    int? updatedAt,
    String? id,
    String? originalName,
    int? imdbVotes,
    String? imdbRating,
    String? rottenRating,
    int? rottenVotes,
    String? year,
    String? imdbId,
    String? alias,
    String? doubanId,
    String? type,
    String? doubanRating,
    int? doubanVotes,
    int? duration,
    String? dateReleased,
  }) {
    return MovieModel()
      ..data = data ?? this.data
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..id = id ?? this.id
      ..originalName = originalName ?? this.originalName
      ..imdbVotes = imdbVotes ?? this.imdbVotes
      ..imdbRating = imdbRating ?? this.imdbRating
      ..rottenRating = rottenRating ?? this.rottenRating
      ..rottenVotes = rottenVotes ?? this.rottenVotes
      ..year = year ?? this.year
      ..imdbId = imdbId ?? this.imdbId
      ..alias = alias ?? this.alias
      ..doubanId = doubanId ?? this.doubanId
      ..type = type ?? this.type
      ..doubanRating = doubanRating ?? this.doubanRating
      ..doubanVotes = doubanVotes ?? this.doubanVotes
      ..duration = duration ?? this.duration
      ..dateReleased = dateReleased ?? this.dateReleased;
  }
}

MovieData $MovieDataFromJson(Map<String, dynamic> json) {
  final MovieData movieData = MovieData();
  final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
  if (createdAt != null) {
    movieData.createdAt = createdAt;
  }
  final int? updatedAt = jsonConvert.convert<int>(json['updatedAt']);
  if (updatedAt != null) {
    movieData.updatedAt = updatedAt;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    movieData.id = id;
  }
  final String? poster = jsonConvert.convert<String>(json['poster']);
  if (poster != null) {
    movieData.poster = poster;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    movieData.name = name;
  }
  final String? genre = jsonConvert.convert<String>(json['genre']);
  if (genre != null) {
    movieData.genre = genre;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    movieData.description = description;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    movieData.language = language;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    movieData.country = country;
  }
  final String? lang = jsonConvert.convert<String>(json['lang']);
  if (lang != null) {
    movieData.lang = lang;
  }
  final String? shareImage = jsonConvert.convert<String>(json['shareImage']);
  if (shareImage != null) {
    movieData.shareImage = shareImage;
  }
  final String? movie = jsonConvert.convert<String>(json['movie']);
  if (movie != null) {
    movieData.movie = movie;
  }
  return movieData;
}

Map<String, dynamic> $MovieDataToJson(MovieData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['id'] = entity.id;
  data['poster'] = entity.poster;
  data['name'] = entity.name;
  data['genre'] = entity.genre;
  data['description'] = entity.description;
  data['language'] = entity.language;
  data['country'] = entity.country;
  data['lang'] = entity.lang;
  data['shareImage'] = entity.shareImage;
  data['movie'] = entity.movie;
  return data;
}

extension MovieDataExtension on MovieData {
  MovieData copyWith({
    int? createdAt,
    int? updatedAt,
    String? id,
    String? poster,
    String? name,
    String? genre,
    String? description,
    String? language,
    String? country,
    String? lang,
    String? shareImage,
    String? movie,
  }) {
    return MovieData()
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..id = id ?? this.id
      ..poster = poster ?? this.poster
      ..name = name ?? this.name
      ..genre = genre ?? this.genre
      ..description = description ?? this.description
      ..language = language ?? this.language
      ..country = country ?? this.country
      ..lang = lang ?? this.lang
      ..shareImage = shareImage ?? this.shareImage
      ..movie = movie ?? this.movie;
  }
}
