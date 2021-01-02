import 'package:flutter/material.dart';

import 'package:weight_tracker/screens/home/index.dart';
import 'package:weight_tracker/screens/sign_up/index.dart';

class Routes {
  static final String defaultRoute = '/sign-up';

  static final list = <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomeScreen(),
    '/sign-up': (BuildContext context) => new SignUpScreen(),
  };
}