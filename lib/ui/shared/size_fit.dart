import 'package:flutter/material.dart';

class SizeFit {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;
  static late double statusBarHeight;

  static late double rpx;
  static late double px;

  // initial
  static void initialize(BuildContext context, {double standardWidth = 750}) {
    // 获取设备信息
    final mediaQuery = MediaQuery.of(context);
    devicePixelRatio = mediaQuery.devicePixelRatio;
    // devicePixelRatio = window.devicePixelRatio;
    // 逻辑分辨率
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    // 物理分辨率
    physicalWidth = screenWidth * devicePixelRatio;
    // physicalWidth = window.physicalSize.width;
    // screenWidth = physicalWidth / devicePixelRatio;
    physicalHeight = screenHeight * devicePixelRatio;
    // screenHeight = physicalHeight / devicePixelRatio;
    // physicalHeight = window.physicalSize.height;

    statusBarHeight = mediaQuery.padding.top / devicePixelRatio;
    // statusBarHeight = window.padding.top / devicePixelRatio;
    // rpx
    rpx = screenWidth / standardWidth;
    px = rpx * 2;
  }
}
