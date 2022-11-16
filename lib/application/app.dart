import 'package:flutter/material.dart';


import '../presentation/managers/route_manager.dart';
import '../presentation/managers/theme_manager.dart';

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key); // Default constructor

  const MyApp._internal(); // Named constructor

  static const MyApp _instance = MyApp._internal(); // singleton pattern

  factory MyApp() => _instance; // factory for singleton

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
