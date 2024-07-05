import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';

ThemeData lighTheme() {
  final ThemeData lighttheme = ThemeData.light();
  return lighttheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colormanager.thewhitecolor,
    appBarTheme: const AppBarTheme(
      color: Colormanager.thewhitecolor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colormanager.thewhitecolor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colormanager.elevatedbuttonBackgroundColor,
        foregroundColor: Colormanager.thewhitecolor,
      ),
    ),
  );
}
