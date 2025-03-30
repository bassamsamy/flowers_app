import 'package:flowers_app/core/routes_manager/routes_names.dart';
import 'package:flowers_app/features/auth/presentation/views/forget_password.dart';
import 'package:flowers_app/features/auth/presentation/views/otp_view.dart';
import 'package:flowers_app/features/auth/presentation/views/reset_password.dart';
import 'package:flowers_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flowers_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:flowers_app/features/layout/presentation/views/layout.dart';
import 'package:flowers_app/features/splash/presentation/cubits/auto_login_cubit/auto_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/splash/domain/use_cases/get_user_data.dart';
import '../../features/splash/presentation/views/spalsh.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AutoLoginCubit(getIt<GetUserDataUseCase>()),
            child: const SplashView(),
          ),
          settings: settings,
        );
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginUseCase>()),
            child: LoginView(),
          ),
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
          builder: (context) => BlocProvider(
            create: (context) => AutoLoginCubit(getIt<GetUserDataUseCase>()),
            child: const SplashView(),
          ),
          settings: settings,
        );
    }
  }
}
