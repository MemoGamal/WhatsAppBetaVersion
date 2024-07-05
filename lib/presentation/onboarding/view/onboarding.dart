import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/signup_page/view/signupview.dart';
import 'package:whatsappclonememo/resources/assets_manager/assets_manager.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s50, vertical: AppSize.s50),
            child: Image.asset(
              AssetsManager.homeviewImage,
              color: Colormanager.homeviewImagebackGroundColor,
            ),
          ),
          const Text(
            Stringmanager.welcometowhatsapp,
            style: TextStyle(
              color: Colormanager.thewhitecolor,
              fontSize: AppSize.s20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Read our",
                style: TextStyle(color: Colormanager.readourColor),
                children: [
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: Colormanager.privacypolciyColor,
                    ),
                  ),
                  TextSpan(text: "tap Agree and continue to accept the "),
                  TextSpan(
                    text: "Terms of Service",
                    style: TextStyle(
                      color: Colormanager.privacypolciyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          //  Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppMargin.m20),
            child: SizedBox(
              width: SizesManager(context: context).width80,
              height: SizesManager(context: context).height005,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const Signupview();
                      },
                    ),
                  );
                },
                child: const Text(Stringmanager.agreeandcontinue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
