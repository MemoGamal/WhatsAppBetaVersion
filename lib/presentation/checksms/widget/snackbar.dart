import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

SnackBar snackbarCustom(
  context, {
  required String first,
  required String second,
}) {
  return SnackBar(
    content: Column(
      children: [
        Text(
          first,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizesManager(context: context).width04,
          ),
        ),
        Text(second),
      ],
    ),
    backgroundColor: Colormanager.redColor,
    dismissDirection: DismissDirection.endToStart,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s20),
      borderSide: const BorderSide(color: Colormanager.redColor),
    ),
    elevation: 6.0,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: SizesManager(context: context).height62,
      left: SizesManager(context: context).width02,
      right: SizesManager(context: context).width02,
    ),
  );
}
