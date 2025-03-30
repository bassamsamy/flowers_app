import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/presentation/views/forget_password.dart';
import 'package:flowers_app/features/auth/presentation/views/otp_view.dart';
import 'package:flowers_app/features/auth/presentation/views/reset_password.dart';
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
        case RoutesNames.opt:
        return MaterialPageRoute(
          builder: (context) => OtpScreen(arguments:settings.arguments),
          settings: settings,
        );
        case RoutesNames.resetPassword:
        return MaterialPageRoute(
          builder: (context) => ResetPassword(arguments:settings.arguments),
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
