import 'package:flutter/material.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/group/group_page.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/home/home_page.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/mall/mall_page.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/profile/profile_page.dart';
import 'package:food_playground/flutter_learner/_practice_douban_demo_P13_P14/ui/pages/subject/subject_page.dart';

class Constants {
  // 私有构造函数
  const Constants._();

  // 项目网络请求的基地址
  static final baseUrl = "https://api.wmdb.tv";

  // 项目网络请求的超时时间
  static const connectTimeout = Duration(seconds: 10);

  // 项目网络请求的超时时间
  static const receiveTimeout = Duration(seconds: 10);

  // 页面列表
  static final List<Widget> pageList = <Widget>[
    const HomePage(),
    const SubjectPage(),
    const GroupPage(),
    const MallPage(),
    const ProfilePage(),
  ];

  // 主页的底部导航栏的列表
  static final List<BottomNavigationBarItem> bottomList =
      <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: '首页',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.my_library_books_outlined),
          activeIcon: Icon(Icons.my_library_books),
          label: '书影音',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          activeIcon: Icon(Icons.groups),
          label: '小组',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.local_mall_outlined),
          activeIcon: Icon(Icons.local_mall),
          label: '市集',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          activeIcon: Icon(Icons.people),
          label: '我的',
        ),
      ];
}
