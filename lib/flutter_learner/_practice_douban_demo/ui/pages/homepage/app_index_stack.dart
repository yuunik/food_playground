import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/widgets/star_rating.dart';

class AppIndexStack extends StatefulWidget {
  const AppIndexStack({super.key});

  @override
  State<AppIndexStack> createState() => _AppIndexStackState();
}

class _AppIndexStackState extends State<AppIndexStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homepage")),
      body: Center(child: StarRating(rating: 5.5)),
    );
  }
}
