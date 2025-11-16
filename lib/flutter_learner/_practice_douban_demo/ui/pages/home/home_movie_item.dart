import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/model/movie_model.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieData movie;

  const HomeMovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xfff2f2f2), width: 4.0),
        ),
      ),
      child: Text(movie.name!),
    );
  }
}
