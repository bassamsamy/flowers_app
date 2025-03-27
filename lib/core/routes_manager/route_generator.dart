import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/forgetPassword/presentation/views/forget-password.dart';
import 'package:flowers_app/features/layout/presentation/views/layout.dart';
import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/spalsh.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
          settings: settings,
        );
        case RoutesNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) =>  ForgetPassword(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
    }
  }
}
