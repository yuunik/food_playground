import 'package:flutter/material.dart';

import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/utils/json_parse.dart';

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({super.key});

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  // 分类列表
  List<CategoryModel> _categoryList = [];

  @override
  void initState() {
    super.initState();
    // 获取 categoryList
    JsonParse.getCategoryList().then((res) {
      setState(() {
        _categoryList = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 2,
            childAspectRatio: 4 / 3),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  _categoryList[index].color!.withOpacity(0.7),
                  _categoryList[index].color!
                ]),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(_categoryList[index].title!,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
          );
        });
  }
}
