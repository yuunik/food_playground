import 'package:flutter/material.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/homepage/app_index_stack.dart';

class DouBanApp extends StatelessWidget {
  const DouBanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppIndexStack());
  }
}
