import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/onboarding/view/onboarding.dart';
import 'package:whatsappclonememo/resources/themedata/dark_theme.dart';
import 'package:whatsappclonememo/resources/themedata/light_theme.dart';
import 'package:whatsappclonememo/resources/wrapper/wrapper.dart';

class MyApp extends StatelessWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lighTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const Wrapper(),
    );
  }
}
