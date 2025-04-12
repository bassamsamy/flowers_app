import 'package:flowers_app/core/app_theme/my_theme_data.dart';
import 'package:flowers_app/core/di/di.dart';
import 'package:flowers_app/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
port 'features/auth/domain/auth_repo/auth_repo.dart';
import 'features/auth/domain/useCases/signup.dart';
import 'features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

void main() {
  configureDependencies();
  runApp(
    BlocProvider(
      create: (context) =>
          SignUpCubit(SignUpUseCase(authRepo: getIt<AuthRepo>())),
      child: const MyApp(),
    ),
  );
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
