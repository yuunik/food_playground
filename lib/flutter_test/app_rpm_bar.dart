import 'package:flutter/material.dart';

class AppRpmBar extends StatelessWidget {
  final double width;

  const AppRpmBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1B1C), Color(0xFF3288F8)],
        ),
      ),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInCirc,
    );
  }
}
