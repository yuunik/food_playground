import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/subject/subject_content.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("书影音")),
      body: SubjectContent(),
    );
  }
}
