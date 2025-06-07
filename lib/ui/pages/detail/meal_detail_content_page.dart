import 'package:flutter/material.dart';

import 'package:food_playground/core/extension/int_fit.dart';
import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/ui/shared/app_theme.dart';

class MealDetailContentPage extends StatelessWidget {
  final MealModel meal;

  const MealDetailContentPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _wBannerImage(),
            _wMenuMaterial(context),
            _wMenuSteps(context)
          ],
        ),
      ),
    );
  }

  // banner 图
  Widget _wBannerImage() {
    return Image.network(meal.imageUrl,
        width: double.infinity, height: 250.px, fit: BoxFit.cover);
  }

  // 制作材料
  Widget _wMenuMaterial(BuildContext context) {
    return Column(
      children: [_wContentTitle(context, "制作材料"), _wMaterialContent()],
    );
  }

  // 制作步骤
  Widget _wMenuSteps(BuildContext context) {
    return Column(
      children: [_wContentTitle(context, "制作流程"), _wStepsContent()],
    );
  }

  // 标题
  Widget _wContentTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.px, horizontal: 20.px),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }

  // 制作材料内容
  Widget _wMaterialContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.px),
      child: Container(
          padding: EdgeInsets.all(6.px),
          decoration: BoxDecoration(
              color: AppTheme.darkColor,
              borderRadius: BorderRadius.circular(12.px),
              border: Border.all(color: Colors.amberAccent)),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                    ));
              })),
    );
  }

  // 制作步骤
  Widget _wStepsContent() {
    return Padding(
      padding: EdgeInsets.only(right: 20.px, left: 20.px, bottom: 12.px),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.px),
        decoration: BoxDecoration(
            color: AppTheme.darkColor,
            border: Border.all(color: Colors.pinkAccent),
            borderRadius: BorderRadius.circular(12.px)),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meal.steps.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    // backgroundColor: Colors.pinkAccent,
                    child: Text(
                      "# ${index + 1}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                    /* 方案二
                    child: ClipOval(
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecorpinkAccent,
                              borderRadius: BorderRadius.circular(12.px)),
                          child: Center(
                            child: Text(
                              "# $index",
                              style: Theme
                                  .of(context)
                                  .textThemeation(
                              color: Colors.
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          )),
                    )*/
                  ),
                  title: Text(meal.steps[index]));
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.pinkAccent)),
      ),
    );
  }
}
