import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/utils/json_parse.dart';
import 'package:food_playground/core/viewmodel/category_view_model.dart';
import 'package:food_playground/ui/pages/home/home_content_item_widget.dart';

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({super.key});

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  late final CategoryViewModel categoryStore;

  @override
  void initState() {
    super.initState();
    categoryStore = Get.put<CategoryViewModel>(CategoryViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryStore.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Get.defaultDialog(title: "你好啊");

      // serve 未开启, 读本地文件
      if (categoryStore.categoryList.isEmpty) {
        print("你又忘记开 serve 了!!!");
        return FutureBuilder<List<CategoryModel>>(
            future: JsonParse.getCategoryList(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Has Error, try again pls..."));
              }
              if (!snapshot.hasData) {
                return Center(
                    child: Column(
                      children: [
                        const CircularProgressIndicator(),
                        Text("又没开 serve 哦!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black54))
                      ],
                    ));
              }
              final categoryList = snapshot.data;
              return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: categoryList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return HomeContentItemWidget(category: categoryList[index]);
                  });
            });
      }

      Get.defaultDialog(title: "你好啊");

      // 网络请求成功
      return Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            itemCount: categoryStore.categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return HomeContentItemWidget(
                  category: categoryStore.categoryList[index]);
            }),
      );
    });
  }
}
