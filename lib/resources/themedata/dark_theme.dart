import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';

ThemeData darkTheme() {
  final ThemeData themedata = ThemeData.dark();
  return themedata.copyWith(
    scaffoldBackgroundColor: Colormanager.homeviewbackGroundColor,
    appBarTheme: const AppBarTheme(
      color: Colormanager.homeviewbackGroundColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colormanager.homeviewbackGroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colormanager.elevatedbuttonBackgroundColor,
        foregroundColor: Colormanager.homeviewbackGroundColor,
      ),
    ),
  );
}
