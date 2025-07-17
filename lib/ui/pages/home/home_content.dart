import 'package:flutter/material.dart';
import 'package:food_playground/ui/pages/home/home_content_item.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/utils/json_parse.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    // 没有开启网络服务器时, 默认走这里,
    // 会去读取本地json 文件数据
    return FutureBuilder(
      future: JsonParseUtil.getCategoryList(),
      builder: (context, snapshot) {
        // 没有获取到数据时, 显示空数据
        if (!snapshot.hasData) {
          return const TDEmpty(
            type: TDEmptyType.plain,
            emptyText: "empty data",
          );
        }

        // 报错时
        if (snapshot.hasError) {
          TDMessage.showMessage(
            context: context,
            visible: true,
            icon: true,
            content: "Network error...",
            theme: MessageTheme.error,
            duration: 500,
          );
          return const TDEmpty(
            type: TDEmptyType.plain,
            emptyText: "empty data",
          );
        }

        List<CategoryModel> categoryList = snapshot.data as List<CategoryModel>;
        return SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 4 / 3,
            ),
            itemBuilder: (context, index) {
              // 取出 当前的category
              final category = categoryList[index];
              return HomeContentItem(category: category);
            },
          ),
        );
      },
    );
  }
}
