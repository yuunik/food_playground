import 'package:food_playground/ui/shared/size_fit.dart';

extension IntFit on int {
  // px 适配
  double get px => toDouble() * SizeFit.px;

  // rpx 适配
  double get rpx => toDouble() * SizeFit.rpx;
}