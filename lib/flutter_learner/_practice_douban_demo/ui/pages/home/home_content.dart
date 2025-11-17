import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/apis/movie_request.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/model/movie_model.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/home/home_movie_item.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: MovieRequest.getMovieList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const CircularProgressIndicator());
        }

        // 获取数据
        final movieList = snapshot.data as List<MovieModel>;
        return ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) =>
              HomeMovieItem(movieList[index], doubanRatingRank: index + 1),
        );
      },
    );
  }
}
