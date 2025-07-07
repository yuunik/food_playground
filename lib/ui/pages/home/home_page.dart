import 'package:flutter/material.dart';

import 'package:food_playground/core/utils/json_parse.dart';
import 'package:food_playground/ui/pages/home/home_content.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homepage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    JsonParseUtil.getCategoryList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage")
      ),
      body: const HomeContent()
    );
  }
}
