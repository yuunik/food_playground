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
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1),
      ),
      body: const Center(
        child: Text("Favorite Page"),
      ),
    );
  }
}
