import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:food_playground/flutter_learner/_07_state_P16/view_model/counter_view_model.dart';
import 'package:food_playground/flutter_learner/_07_state_P16/view_model/user_view_model.dart';

List<SingleChildWidget> providerList = [
  ChangeNotifierProvider(create: (BuildContext context) => CounterViewModel()),
  ChangeNotifierProvider(create: (BuildContext context) => UserViewModel()),
];
