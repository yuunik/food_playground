import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/model/movie_model.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieModel movie;

  const HomeMovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(movie.originalName!));
  }
}
