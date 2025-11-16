import 'package:food_playground/flutter_learner/_practice_douban_demo/core/model/movie_model.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/services/http_request.dart';

class MovieRequest {
  const MovieRequest._();

  static Future<List<MovieModel>> getMovieList() async {
    final result = await HttpRequest.send(
      url: "/api/v1/top?type=Douban&skip=0&limit=50&lang=Cn",
    );

    final List<MovieModel> movieList = [];

    for (var movie in result) {
      movieList.add(MovieModel.fromJson(movie as Map<String, dynamic>));
    }

    return movieList;
  }
}
