import 'package:flutter/material.dart';

import 'package:food_playground/core/extension/int_fit.dart';
import 'package:food_playground/core/model/meal_model.dart';
import 'package:food_playground/ui/pages/detail/meal_detail_page.dart';
import 'package:food_playground/ui/widgets/meal_operation_item.dart';

class MealCard extends StatefulWidget {
  final MealModel _meal;

  const MealCard(this._meal, {super.key});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(MealDetailPage.routeName, arguments: widget._meal),
      child: Card(
        margin: const EdgeInsets.all(20),
        elevation: 5,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [buildMenuInfo(context), buildOperationInfo(context)],
        ),
      ),
    );
  }

  Widget buildMenuInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.px),
                topRight: Radius.circular(12.px)),
            child: Image.network(widget._meal.imageUrl,
                loadingBuilder: (BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress != null) {
                    // 图标加载未完成
                    return const Center(child: CircularProgressIndicator());
                  }
                  // 加载完成
                  return child;
                },
                width: double.infinity, height: 250.px, fit: BoxFit.cover)),
        Positioned(
          bottom: 10.px,
          right: 10.px,
          left: 10.px,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.px),
                color: Colors.black54),
            child: Text(
              widget._meal.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MealOperationItem(const Icon(Icons.schedule, color: Colors.grey),
              "${widget._meal.duration} min"),
          MealOperationItem(const Icon(Icons.restaurant, color: Colors.grey),
              widget._meal.complexityStr),
          MealOperationItem(const Icon(Icons.favorite, color: Colors.grey),
              widget._meal.isFavorite ? 'Collected' : 'Not favorite')
        ],
      ),
    );
  }
}
