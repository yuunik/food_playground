import 'package:food_playground/ui/shared/size_fit.dart';

extension DoubleFit on double {
  // px 适配
  double get px => this * SizeFit.px;

  // rpx 适配
  double get rpx => this * SizeFit.rpx;
}