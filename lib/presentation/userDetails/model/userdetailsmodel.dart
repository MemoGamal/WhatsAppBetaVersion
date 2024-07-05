import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';
import 'package:whatsappclonememo/presentation/checksms/widget/snackbar.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';

class UserdetailsModel extends BaseViewModel
    with UserdetailsModelInput, UserdetailsModelOutPut {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final StreamController _streamcontroller = StreamController();
  final storageRef =
      FirebaseStorage.instance.ref('images/${Stringmanager.phonenumber}');
  final picker = ImagePicker();
  File? image;

  @override
  void start() {
    Country mycountry = Country(
      nameofCountry: Stringmanager.countryName,
      phoneCodeNumber: Stringmanager.phoneCodenumber,
    );
    CountryPhoneNumber thecountryphonenumber = CountryPhoneNumber(
      mycountry: mycountry,
      phoneNumber: Stringmanager.phonenumber,
      theerrorMessage: Stringmanager.errorMessage,
    );

    UserDetails myuserDetails = UserDetails(
      countryPhoneNumber: thecountryphonenumber,
      userName: Stringmanager.userDetailsformfieldvalue,
      userImagePathOnFireBase: "images/${Stringmanager.phonenumber}",
      imageFile: image,
    );

    // Add to stream..
    userdetailsModelInputSink.add(myuserDetails);
  }

  // Method to get user picture.
  Future imagePickerFun(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      // Get.snackbar("No Image", "Please select an Image.");
      ScaffoldMessenger.of(context).showSnackBar(
        snackbarCustom(
          context,
          first: Stringmanager.noImage,
          second: Stringmanager.selectImage,
        ),
      );
    }
  }

  //Method to catch textformfield value..
  @override
  void onChanged(String value) {
    Stringmanager.userDetailsformfieldvalue = value;
  }

  // Method to upload to firebase..

  Future uploadtoFirebase() async {
    if (Stringmanager.userDetailsformfieldvalue != null && image != null) {
      var nav =
          firebaseFirestore.collection("Users").doc(Stringmanager.phonenumber);

      await storageRef.putFile(image!);

      nav.update(
        {
          "name": Stringmanager.userDetailsformfieldvalue,
          "PhoneNumber": Stringmanager.phonenumber,
          "image": "images/${Stringmanager.phonenumber}",
          "CountryPhoneCode": Stringmanager.phoneCodenumber,
          "Country Name": Stringmanager.countryName,
        },
      );
    }
  }

  @override
  void dispose() {
    _streamcontroller.close();
  }

  @override
  Sink get userdetailsModelInputSink => _streamcontroller.sink;

  @override
  Stream<UserDetails> get userdetailsModelOutPutStream =>
      _streamcontroller.stream.map((event) => event);
}

abstract mixin class UserdetailsModelInput {
  void onChanged(String value);
  Sink get userdetailsModelInputSink;
}

abstract mixin class UserdetailsModelOutPut {
  Stream get userdetailsModelOutPutStream;
}
