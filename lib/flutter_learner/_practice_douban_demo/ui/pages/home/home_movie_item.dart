import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/model/movie_model.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/widgets/dashed_line.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/widgets/star_rating.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieModel movie;

  // 评分排名
  final int doubanRatingRank;

  const HomeMovieItem(this.movie, {super.key, required this.doubanRatingRank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffe1e3e1), width: 4.0),
        ),
      ),
      child: Column(
        spacing: 8.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头部
          buildHeaderInfo(),
          // 内容区
          buildContentInfo(),
          // 电影简介
          buildMovieSummary(),
        ],
      ),
    );
  }

  // 获取评分排名组件
  Widget buildHeaderInfo() => Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 238, 205, 144),
      borderRadius: BorderRadius.circular(3.0),
    ),
    child: Text(
      "No.$doubanRatingRank",
      style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 131, 95, 36)),
    ),
  );

  // 获取内容区组件
  Widget buildContentInfo() => Row(
    spacing: 8.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 电影海报
      buildPoster(),

      // 电影详情
      buildMovieDetail(),

      // 内容分割线
      buildContentDivider(),

      // 想看
      buildWishContent(),
    ],
  );

  // 获取电影海报组件
  Widget buildPoster() {
    // 获取电影信息
    final movieDetail = movie.data?[0];

    if (movieDetail == null) {
      return SizedBox.shrink();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.network(
        movieDetail.poster!,
        height: 150,
        fit: BoxFit.cover,
        // loadingBuilder: (context, child, progress) {
        //   // if (progress == null) return child;
        //
        //   return Center(child: CircularProgressIndicator());
        // },
      ),
    );
  }

  // 获取电影详情组件
  Widget buildMovieDetail() => Expanded(
    child: Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 电影标题信息
        buildMovieTitle(),
        // 电影评分
        buildStarRating(),
        // 电影标签等信息
        buildMovieTag(),
      ],
    ),
  );

  // 电影标题信息
  /// 富文本框可以防止宽度不够用时, 自动换行
  Widget buildMovieTitle() => Text.rich(
    TextSpan(
      children: [
        // 图标
        WidgetSpan(
          alignment: PlaceholderAlignment.middle, // ← 垂直居中对齐
          child: Icon(
            Icons.play_circle_outlined,
            size: 24,
            color: Colors.redAccent,
          ),
        ),
        const TextSpan(text: " "),
        // 电影名
        TextSpan(
          text: movie.data?[0].name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const TextSpan(text: " "),
        // 电影上映时间
        TextSpan(
          text: "(${movie.year})",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    ),
  );

  // 电影评分组件
  Widget buildStarRating() {
    return Row(
      spacing: 6.0,
      children: [
        StarRating(rating: double.parse(movie.doubanRating!), starSize: 20),
        Text(movie.doubanRating!, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  // 电影标签等信息
  Widget buildMovieTag() {
    // 电影别名
    final alias = movie.alias;
    // 电影类型
    final genres = movie.data![0].genre;
    // 电影语言
    final language = movie.data![0].language;

    return Text(
      "$alias / $genres / $language",
      style: TextStyle(fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // 内容分割线组件
  Widget buildContentDivider() {
    return DashedLine(
      length: 100,
      direction: Axis.vertical,
      dashLength: .4,
      dashThickness: 6,
    );
  }

  // 愿望清单组件
  Widget buildWishContent() {
    const commonColor = Color.fromARGB(255, 235, 170, 60);
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4.0,
        children: [
          Icon(Icons.add_task_outlined, color: commonColor),
          Text("想看", style: TextStyle(fontSize: 14, color: commonColor)),
        ],
      ),
    );
  }

  // 电影简介
  Widget buildMovieSummary() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xffe1e3e1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        movie.data![0].description!,
        style: TextStyle(fontSize: 14),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
