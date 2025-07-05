import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homepage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage")
      ),
      body: Center(
        child: Text("homepage page~"),
      )
    );
  }
}
