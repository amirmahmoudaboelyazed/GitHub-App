import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'ui/home_page_ui/home_page.dart';

class AppRouters {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case MyStrings.homeScreen:
        return MaterialPageRoute(builder: (_) =>  HomePage());
    }
    return null;
  }
}
