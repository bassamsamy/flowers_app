import 'package:flowers_app/core/di/di.dart' as coreDi;
import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flowers_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flowers_app/features/layout/presentation/views/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup/signup_view.dart';
import '../../features/splash/presentation/views/spalsh.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(coreDi.getIt<LoginUseCase>()),
            child: LoginView(),
          ),
          settings: settings,
        );
      case RoutesNames.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
 