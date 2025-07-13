import 'package:flutter/cupertino.dart';

class ScreenFit {
  // 物理像素宽度
  static late double physicalWidth;
  // 物理像素高度
  static late double physicalHeight;
  // 逻辑像素宽度
  static late double screenWidth;
  // 逻辑像素高度
  static late double screenHeight;
  // 设备像素比
  static late double devicePixelRatio;
  // 状态栏高度
  static late double statusBarHeight;
  static late double rpx;
  static late double px;

  // 初始化, 获取设备信息
  static initialize(BuildContext context, {double standardWidth = 750}) {
    final deviceInfo = MediaQuery.of(context);
    screenWidth = deviceInfo.size.width;
    screenHeight = deviceInfo.size.height;
    devicePixelRatio = deviceInfo.devicePixelRatio;
    physicalWidth = deviceInfo.size.width * devicePixelRatio;
    physicalHeight = deviceInfo.size.height * devicePixelRatio;
    statusBarHeight = deviceInfo.padding.top;
    rpx = screenWidth / standardWidth;
    px = rpx * 2;
  }

  // 设置 rpx
  double setRpx(double size) => size * rpx;

  // 设置 px
  double setPx(double size) => size * px;
}
