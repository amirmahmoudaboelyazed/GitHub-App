import 'package:flutter/material.dart';

import 'app_route.dart';

void main() {
  runApp(MyApp(
    appRouters: AppRouters(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouters appRouters;

  const MyApp({Key? key, required this.appRouters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouters.generateRouter,
    );
  }
}
