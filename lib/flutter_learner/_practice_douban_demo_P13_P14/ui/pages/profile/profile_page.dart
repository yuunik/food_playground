import 'package:flutter/material.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/profile/profile_content_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: ProfileContentPage(),
    );
  }
}
