import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/signup_page/model/signupmodel.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class CountryPicker extends ConsumerWidget {
  const CountryPicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    SignupModel signupModel = SignupModel();
    signupModel.start();

    return StreamBuilder<CountryPhoneNumber>(
      stream: signupModel.outPutTextFormFieldObjects,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return uiWidget(context, snapshot.data!);
        } else {
          return Container();
        }
      },
    );
  }
}

Widget textformfieldWidget(context, CountryPhoneNumber data) {
  SignupModel signupModel = SignupModel();

  return SizedBox(
    width: SizesManager(context: context).width70,
    // height: SizesManager(context: context).height005,
    child: TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        signupModel.onChanged(value, context);
      },
      decoration: InputDecoration(
        error: Stringmanager.errorMessage == null
            ? null
            : Text("${data.theerrorMessage}"),
        // errorText: data.theerrorMessage,
      ),
    ),
  );
}

Widget uiWidget(context, CountryPhoneNumber data) {
  SignupModel signupModel = SignupModel();

  return Column(
    children: [
      InkWell(
        onTap: () {
          showCountryPicker(
            context: context,
            onSelect: (value) {
              // ref.read(signUpProviderNotifier.notifier).changeCountry(
              //       value.phoneCode,
              //       value.displayNameNoCountryCode,
              //     );
              Stringmanager.phoneCodenumber = value.phoneCode;
              Stringmanager.countryName = value.displayNameNoCountryCode;
              signupModel.start();
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.mycountry.nameofCountry,
              style: const TextStyle(
                color: Colormanager.semiblue,
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s20,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: AppSize.s20,
            ),
          ],
        ),
      ),
      const SizedBox(height: AppSize.s20),

      // Second row
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "+${data.mycountry.phoneCodeNumber}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s22,
              color: Colormanager.semiblue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppMargin.m10,
            ),
            child: textformfieldWidget(context, data),
          ),
          // StreamBuilder(
          //   stream: formFieldClass.outPutTextFormFieldObjects,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       return textformfieldWidget(context, snapshot.data);
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
          // //
          // SizedBox(
          //   width: SizesManager(context: context).width70,
          //   height: SizesManager(context: context).height005,
          //   child: Form(
          //     key: Injections.countrypickerInjection.formKey, // first edit..
          //     child: TextFormField(
          //       keyboardType: TextInputType.phone,
          //       controller: Injections
          //           .countrypickerInjection.thecontroller, // second edit..
          //       validator: (value) {
          //         // first edit..
          //         return Injections.countrypickerInjection
          //             .validateMobile(value!, context);
          //       },
          //       onChanged: (value) {
          //         Injections.countrypickerInjection.formKey.currentState!
          //             .validate();
          //         Injections.countrypickerInjection.validator();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    ],
  );
}
