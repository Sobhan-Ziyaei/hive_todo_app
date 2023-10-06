

import 'package:flutter/material.dart';
import 'package:hive_todo_app/gen/fonts.gen.dart';
import 'package:hive_todo_app/ui/constant/colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: blackColor ,
        fontSize: 20 ,
        fontWeight: FontWeight.w600 ,
        fontFamily: FontFamily.vazir ,
      ),
      bodySmall: TextStyle(
        color: blackColor ,
        fontSize: 15,
        fontFamily: FontFamily.vazir ,
      ),
    ),
  );
}