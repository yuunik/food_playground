import 'package:flutter/material.dart';
import 'package:food_playground/core/extension/int_fit.dart';

class MealOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;

  const MealOperationItem(this._icon, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(width: 3.px),
        Text(_title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black
        ))
      ],
    );
  }
}
