import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  // route name
  static const String routeName = "/favorite";

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
      ),
      body: const Center(
        child: Text("Favorite Page"),
      ),
    );
  }
}
