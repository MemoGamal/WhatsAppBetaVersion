import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';
import 'package:whatsappclonememo/presentation/checksms/view/checksmsview.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';

class SignUpProvider extends Notifier<Country> {
  @override
  build() {
    return Country(
      phoneCodeNumber: Stringmanager.phoneCodenumber,
      nameofCountry: Stringmanager.countryName,
    );
  }

  void changeCountry(phoneCodeNumber, nameofCountry) {
    state = Country(
      phoneCodeNumber: phoneCodeNumber,
      nameofCountry: nameofCountry,
    );
    Stringmanager.phoneCodenumber = phoneCodeNumber;
    Stringmanager.countryName = nameofCountry;
  }
}

final signUpProviderNotifier = NotifierProvider<SignUpProvider, Country>(
  () {
    return SignUpProvider();
  },
);

/////////////////////////////////////////////////////////////

class SignupModel extends BaseViewModel
    with TextFormFieldInputs, TextFormFieldOutPuts {
  final StreamController<CountryPhoneNumber> streamController =
      StreamController<CountryPhoneNumber>();
  @override
  void start() {
    postDataToUI();
  }

  @override
  void dispose() {
    streamController.close();
  }

  @override
  void onChanged(String value, context) {
    validateMobile(value);
    if (Stringmanager.errorMessage == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const Checksmsview();
          },
        ),
      );
    }
    start();
    //I want to validate the mobile phone number..
    // if valid i want to send to firebase request to send sms..
    // then after that gets to next screen..
  }

  // Post Data to UI Method.
  void postDataToUI() {
    Country mycountry = Country(
      nameofCountry: Stringmanager.countryName,
      phoneCodeNumber: Stringmanager.phoneCodenumber,
    );
    inputTextFormFieldObjects.add(
      CountryPhoneNumber(
        mycountry: mycountry,
        phoneNumber: Stringmanager.phonenumber,
        theerrorMessage: Stringmanager.errorMessage,
      ),
    );
  }

  //Method to validate phone number

  validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';

    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      Stringmanager.phonenumber = value;

      Stringmanager.errorMessage = 'Please enter mobile number';
    }
    if (!regExp.hasMatch(value)) {
      Stringmanager.phonenumber = value;

      Stringmanager.errorMessage = 'Please enter valid mobile number';
    }
    if (regExp.hasMatch(value)) {
      Stringmanager.phonenumber = value;
      Stringmanager.errorMessage = null;
    }
  }

  //On select method..
  @override
  void onSelect(value) {
    Stringmanager.phoneCodenumber = value.phoneCode;
    Stringmanager.countryName = value.displayNameNoCountryCode;
    start();
    print(value);
  }

  @override
  Sink get inputTextFormFieldObjects => streamController.sink;

  //OutPuts
  @override
  Stream<CountryPhoneNumber> get outPutTextFormFieldObjects =>
      streamController.stream.map((event) => event);
}

abstract mixin class TextFormFieldInputs {
  void onChanged(String value, context);
  void onSelect(value);
  Sink get inputTextFormFieldObjects;
}

abstract mixin class TextFormFieldOutPuts {
  Stream get outPutTextFormFieldObjects;
}
