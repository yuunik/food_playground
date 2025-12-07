import 'package:flutter/material.dart';

class MallPage extends StatelessWidget {
  const MallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("市集")),
      body: Center(child: Text("MALL")),
    );
  }
}
