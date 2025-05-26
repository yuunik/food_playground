import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // route name
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
