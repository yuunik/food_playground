import 'package:flutter/material.dart';
import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/core/utils/json_parse.dart';
import 'package:food_playground/ui/pages/home/home_content_item_widget.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
        future: JsonParse.getCategoryList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Has Error, try again pls..."));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
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
}
