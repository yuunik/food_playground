import 'package:flutter/material.dart';
import 'package:food_playground/core/utils/json_parse.dart';
import 'package:food_playground/core/model/category_model.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JsonParseUtil.getCategoryList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const TDEmpty(
            type: TDEmptyType.plain,
            emptyText: "empty data",
          );
        }

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
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                color: Colors.red,
                child: Center(child: Text("${categoryList[index].title}")),
              );
            },
          ),
        );
      },
    );
  }
}
