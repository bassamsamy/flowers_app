import 'package:flutter/material.dart';

import '../resources/AppColors.dart';
import '../resources/constants_manger.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: AppColors.blackTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.fontFamily),
    ),
  );
}
