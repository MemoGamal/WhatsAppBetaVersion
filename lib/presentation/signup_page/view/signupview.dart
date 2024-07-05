import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/signup_page/widgets/country_picker.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          Stringmanager.enterphonenumber,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizesManager(context: context).width04,
              vertical: AppMargin.m10,
            ),
            child: Column(
              children: [
                Text(
                  Stringmanager.confirmcontrycode,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: SizesManager(context: context).width04,
                  ),
                ),
                //Why Row?
                Row(
                  children: [
                    SizedBox(
                      width: SizesManager(context: context).width05,
                    ),
                    Text(
                      Stringmanager.carrierCharges,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: SizesManager(context: context).width04,
                      ),
                    ),
                    Text(
                      Stringmanager.whatsmyphonenumber,
                      style: TextStyle(
                        color: Colormanager.privacypolciyColor,
                        fontWeight: FontWeight.normal,
                        fontSize: SizesManager(context: context).width04,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppMargin.m20,
              vertical: AppMargin.m10,
            ),
            child: CountryPicker(),
          ),
        ],
      ),
    );
  }
}
