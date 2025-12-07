import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_07_state_P16/model/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserInfo _userInfo = UserInfo.mock();

  UserInfo get userInfo => _userInfo;

  set userInfo(UserInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
