import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Resendsms extends StatelessWidget {
  const Resendsms({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //ontap send to firebase..
      child: Text(
        Stringmanager.resendsms,
        style: const TextStyle(
          color: Colormanager.privacypolciyColor,
          fontSize: AppSize.s16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
