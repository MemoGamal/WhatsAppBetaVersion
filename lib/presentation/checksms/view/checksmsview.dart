import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/checksms/model/checksmsmodel.dart';
import 'package:whatsappclonememo/presentation/checksms/widget/resendsms.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Checksmsview extends StatefulWidget {
  const Checksmsview({super.key});

  @override
  State<Checksmsview> createState() => _ChecksmsviewState();
}

class _ChecksmsviewState extends State<Checksmsview> {
  VerificationOfSignUP verificationofsignup = VerificationOfSignUP();
  @override
  void initState() {
    verificationofsignup.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: verificationofsignup.scaffoldKey,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizesManager(context: context).width20,
              vertical: AppPading.p30,
            ),
            child: const Text(
              Stringmanager.verifyingyourphonenumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s22,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizesManager(context: context).width04,
            ),
            child: const Text(
              Stringmanager.autodetectsms,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Stringmanager.phonenumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s16,
                ),
              ),
              // Wrong number
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  Stringmanager.wrongNumber,
                  style: TextStyle(
                    color: Colormanager.privacypolciyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.s16,
                  ),
                ),
              ),
            ],
          ),

          // Text field for checking the sms..
          SizedBox(
            width: SizesManager(context: context).width50,
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: AppSize.s30),
                hintText: "- - -   - - -",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s30,
                ),
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: verificationofsignup.checksmsformFieldController,
              maxLength: 6,
              onChanged: (value) {
                verificationofsignup.onChanged(value, context);
              },
            ),
          ),
          SizedBox(
            height: SizesManager(context: context).height005,
          ),
          const Text(
            Stringmanager.didntrecievecode,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Stringmanager.requestnewOne,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s16,
                ),
              ),
              verificationofsignup.time <= 0
                  ? const Resendsms()
                  : Text(
                      verificationofsignup.time.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s16,
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
