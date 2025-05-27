import 'package:flutter/material.dart';
import 'package:food_playground/core/extension/int_fit.dart';
import 'package:food_playground/core/model/CateogryModel.dart';
import 'package:food_playground/core/utils/json_parse.dart';

class HomeContentWidget extends StatefulWidget {
  const HomeContentWidget({super.key});

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  // 分类列表
  late List<CategoryModel> _categoryList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 获取 categoryList
    JsonParse.getCategoryList().then((res) {
      setState(() {
        _categoryList = res;
        print("$res ????????????? ");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1),
      ),
      body: Center(
        child: Text(
          "HomePage",
          style: TextStyle(fontSize: 35.rpx),
        ),
      ),
    );
  }
}
