import 'package:flutter/material.dart';

import 'package:food_playground/ui/pages/meal/meal_page.dart';
import 'package:food_playground/core/model/category_model.dart';

class HomeContentItemWidget extends StatelessWidget {
  final CategoryModel category;

  const HomeContentItemWidget({ super.key, required this.category });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MealPage.routeName, arguments: category);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color!.withOpacity(.5),
              category.color!
            ]
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text("${category.title}", style: Theme.of(context).textTheme.displayMedium!.copyWith(
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}
