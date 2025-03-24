import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';


class AppTheme {
  static ThemeData MyTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primryColor,
    appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.primryColor,
        elevation: 0,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold)),
  );
}
