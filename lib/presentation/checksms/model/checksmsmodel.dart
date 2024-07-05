import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';
import 'package:whatsappclonememo/presentation/checksms/widget/snackbar.dart';
import 'package:whatsappclonememo/presentation/mainscreen/view/mainview.dart';
import 'package:whatsappclonememo/presentation/userDetails/view/userdetailsview.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class VerificationOfSignUP extends BaseViewModel
    with VerificationOfSignUPInputs, VerificationOfSignUPOutPuts {
  final StreamController _streamController = StreamController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int time = 120;
  bool isUserExists = false;
  TextEditingController checksmsformFieldController = TextEditingController();
  @override
  void start() {
    sendSMS(
        "+${Stringmanager.phoneCodenumber}${Stringmanager.phonenumber.substring(1, 4)}${Stringmanager.phonenumber.substring(4, 7)}${Stringmanager.phonenumber.substring(7, 11)}");
    timer();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void onChanged(String value, context) {
    if (value.length == 6) {
      smsVerificationWithFirebase(Stringmanager.verificationID, context);
    }
  }

  @override
  void timer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        time -= 1;
      },
    );
  }

  //Methods to verify with firebase..
  smsVerificationWithFirebase(theverificationid, context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: theverificationid,
      smsCode: checksmsformFieldController.text,
    );
    try {
      await auth.signInWithCredential(credential).then(
            (value) => navigateToNextScreen(context),
          );
    } catch (e) {
      if (e.toString() == Stringmanager.firebaseErrorWrongCode) {
        ScaffoldMessenger.of(context).showSnackBar(
          snackbarCustom(
            context,
            first: Stringmanager.error,
            second: Stringmanager.wrongcode,
          ),
        );
      }
    }
  }

  // method of after entering sms code..

  navigateToNextScreen(context) {
    // find out if current user exists before or new user..
    // Current user exists before if he uninstalled app and re - installed it..\
    // Checking firebase for his current infromation data..
    addUserToFireBase(Stringmanager.phonenumber);
    if (isUserExists == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Mainview(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Userdetailsview(),
        ),
      );
    }
  }

  // Method of adding user to firebase..
  addUserToFireBase(phonerNumberOfUser) {
    firestore.collection("Users").doc("RegisterdUsers").update({
      "phone$phonerNumberOfUser": phonerNumberOfUser
          .toString()
          .replaceAll(" ", "")
          .replaceAll("+20", ""),
    }).onError(
      (error, stackTrace) {
        isUserExists = true;
        firestore.collection("Users").doc("RegisterdUsers").set({
          "phone$phonerNumberOfUser": phonerNumberOfUser
              .toString()
              .replaceAll(" ", "")
              .replaceAll("+20", ""),
        });
      },
    );
  }

  //Method of asking firebase to send sms..
  void sendSMS(phonenumber) {
    // Send Firebase details of phonenumber.
    auth
        .verifyPhoneNumber(
      phoneNumber: phonenumber,
      timeout: const Duration(minutes: 2),
      verificationCompleted: (phoneAuthCredential) async {
        // In case of completiion of verification..

        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        // Incase of error handle it..
      },
      codeSent: (verificationId, forceResendingToken) {
        //Ask user to enter the code..
        Stringmanager.verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // Handle timeout..
      },
    )
        .onError(
      (error, stackTrace) {
        // Edit this later..
      },
    );
  }

  // Inputs and OutPuts..

  @override
  Sink get verificationOfSignUPInputsSink => _streamController.sink;

  @override
  Stream get verificationOfSignUPOutPutsStream =>
      _streamController.stream.map((event) => event);
}

abstract mixin class VerificationOfSignUPInputs {
  // on changed function for the textformfield..
  // timer ..
  // to change time ..in case zero replace with text request again..
  // phonenumber to send sms to..
  // navigate back using go back button.
  void onChanged(String value, context);
  void timer();
  Sink get verificationOfSignUPInputsSink;
}

abstract mixin class VerificationOfSignUPOutPuts {
  Stream get verificationOfSignUPOutPutsStream;
}
