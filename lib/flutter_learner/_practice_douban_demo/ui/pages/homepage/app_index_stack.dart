import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/widgets/dashed_line.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo/widgets/star_rating.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashedLine(length: 100, dashLength: 5),
            DashedLine(length: 100, dashThickness: 5, direction: Axis.vertical),
          ],
        ),
      ),
    );
  }
}
