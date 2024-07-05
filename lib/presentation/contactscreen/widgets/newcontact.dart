import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';


class Newcontact extends StatelessWidget {
  final IconData theicon;
  final String thetext;
  const Newcontact({super.key, required this.theicon, required this.thetext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // imageIcon..
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colormanager.elevatedbuttonBackgroundColor,
          ),
          width: SizesManager(context: context).width10,
          height: SizesManager(context: context).height10,
          child: Icon(
            theicon,
            size: SizesManager(context: context).width07,
            color: Colormanager.thewhitecolor,
          ),
        ),
        const SizedBox(
          width: AppMargin.m20,
        ),
        // Text new contact..
        Text(
          thetext,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizesManager(context: context).width05,
          ),
        ),
      ],
    );
  }
}
