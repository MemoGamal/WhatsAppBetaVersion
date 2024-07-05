import 'package:flutter/material.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class TheMessage extends StatelessWidget {
  final Color thecolor;
  final String themessage;
  final String timeofthemessageInHours;
  final String timeofthemessageInMinutes;

  const TheMessage({
    super.key,
    required this.thecolor,
    required this.themessage,
    required this.timeofthemessageInHours,
    required this.timeofthemessageInMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizesManager(context: context).width50,
      decoration: BoxDecoration(
        color: thecolor,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Column(
        children: [
          Text(
            themessage,
            style: TextStyle(
              fontSize: SizesManager(context: context).width05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeofthemessageInHours,
                  style: TextStyle(
                    fontSize: SizesManager(context: context).width03,
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: SizesManager(context: context).width03,
                  ),
                ),
                Text(
                  timeofthemessageInMinutes,
                  style: TextStyle(
                    fontSize: SizesManager(context: context).width03,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
