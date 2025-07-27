import 'package:flutter/material.dart';
import 'package:food_playground/core/model/category_model.dart';
import 'package:food_playground/ui/pages/meal/meal_page.dart';

class HomeContentItem extends StatelessWidget {
  final CategoryModel category;

  const HomeContentItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bgColor = category.color;

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MealPage.routeName, arguments: category),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor.withValues(alpha: 0.5),
              bgColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
