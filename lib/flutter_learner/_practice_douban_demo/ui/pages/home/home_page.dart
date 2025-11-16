import 'package:flutter/material.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/home/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: HomeContent(),
    );
  }
}
