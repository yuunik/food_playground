import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo/core/util/constants.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo/widgets/dashed_line.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 当前页面的索引值
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: Constants.pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        unselectedFontSize: 14.0,
        selectedFontSize: 14.0,

        /// 当底部栏图标超过 4 个时, 需设置 type 为 BottomNavigationBarType.fixed
        /// 否则图标文字将会隐藏
        type: BottomNavigationBarType.fixed,
        items: Constants.bottomList,
        onTap: (val) {
          setState(() {
            _currentPageIndex = val;
          });
        },
      ),
    );
  }
}
