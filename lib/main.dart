import 'package:flowers_app/core/app_theme/my_theme_data.dart';
import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/routes_manager/route_generator.dart';
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoutes,
      title: "Flowers App",
      theme: AppTheme.myTheme,
    );
  }
}
