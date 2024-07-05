import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';

class Contactscreenmodel {
  Map<String, String> phoneAndName = {};
  // map contains all data from contacts .. key and value -> key is name and value is phonenumber..
  late DocumentSnapshot<Map<String, dynamic>> snapshot;
  // used to fetch data from firebase..
  var nameGetter;
  // Name of contact.. Used as key in map("phoneAndName")..
  final numberofcontacts = FlutterContacts.getContacts();
  // Values of contacts found on firebasefirestore and phone contacts..
  List valuesofContacts = [];

  // bool to check if process is done or not..
  bool isdone = false;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  var tempPhotourl;
  String thenameofContact = "";
  String bioStatus = "";
  var usersRef;

  checkuserImageonFirebase(phonenumber) async {
    final imageRef = firebaseStorage.ref('images').child(phonenumber);
    // Replace with your image path
    try {
      tempPhotourl = await imageRef.getData();
      return tempPhotourl;
    } catch (error) {
      // Handle errors (e.g., print error message, show a snackbar)

      return "";
      // Or return a default image URL if desired
    }

    //
  }

  // Get name out of phone func.
  String findKeyByValue(Map<String, String> map, String value) {
    return map.keys.firstWhere(
      (element) => map[element] == value,
    );
  }

  namegetter(int index) {
    thenameofContact = findKeyByValue(phoneAndName, valuesofContacts[index]);
  }

  userref(int index) async {
    usersRef = await firebaseFirestore
        .collection("Users")
        .doc(valuesofContacts[index])
        .get();
  }

  bioget(int index) {
    userref(index);
    try {
      bioStatus = usersRef["BIO"];
    } catch (e) {}
  }

// Splash screen fix
// Themes white and dark fix..
// Navigation fix..
// asking user of their name and photo
// chat on mainscreen ui
// contact screen page ui..
}

class PhoneContactsModel extends BaseViewModel
    with PhoneContactsModelInputs, PhoneContactsModelOutPuts {
  final StreamController _streamController = StreamController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Map<String, String> phoneAndName = {};
  // map contains all data from contacts .. key and value -> key is name and value is phonenumber..
  late var snapshot;
  List valuesofContacts = [];
  bool isFuncOver = false;
  List sendDataToUI = [];
// ValueofContacts list contains all phone numbers found on firebase and on phone in contacts..
// Which means this user has installed and uses my application..
  @override
  void start() {
    requestContactsPermission();
    mygetContacts();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  // Method to post data to ui.
  void postDataToUI() {
    if (isFuncOver == true) {
      // edit this..

      phoneContactsModelInputsObjects.add(sendDataToUI);
    }
  }

  // Method to ask for user permission in accessing contacts..
  requestContactsPermission() async {
    PermissionStatus status = await Permission.contacts.request();

    if (status.isGranted) {
      PermissionStatus.granted;
    } else if (status.isDenied) {
      status = await Permission.contacts.request();
    }
  }

  // Method to get current registerd users from firebase..
  Future mygetContacts() async {
    // Get firebase registerd users phone numbers...
    print("Getting contacts");
    final usersRef =
        firebaseFirestore.collection('Users').doc("RegisterdUsers");
    // Create a new document with the provided data
    try {
      snapshot = await usersRef.get();
      fetchingContacts();
    } catch (e) {
      print("error is $e");
    }
  }

  // Method to get Phone contacts from phone ..
  Future fetchingContacts() async {
    print("fetching contacts");

    // Fetching phoneContacts..
    final contactid = await FlutterContacts.getContacts();
    for (int i = 0; i <= contactid.length - 1; i++) {
      final contact = await FlutterContacts.getContact(contactid[i].id);
      if (contact!.phones.isNotEmpty &&
          contact.phones.first.toString().isNotEmpty) {
        String nameGetter =
            "${contact.name.first}${contact.name.middle}${contact.name.last}${contact.name.nickname}";

        phoneAndName.addAll({
          nameGetter: contact.phones
              .toList()[0]
              .number
              .toString()
              .replaceAll(" ", "")
              .replaceAll("+20", "0"),
        });
      }
    }
    compareFun();
  }

  // Method to compare between fetched phone contacts & firebase contacts..

  compareFun() {
    print("comparing contacts");

    snapshot.data()!.forEach(
      (key, value) {
        if (phoneAndName.containsValue(value)) {
          valuesofContacts.add(value);
        } else {}
      },
    );
    isFuncOver = true;
    getDataReady();
  }

// Method to arrange and get data ready..
  getDataReady() async {
    Set data = Set();
    data.addAll(valuesofContacts);
    for (int i = 0; i <= data.length - 1; i++) {
      // find name of phonenumber.
      print(findKeyByValue(phoneAndName, data.toList()[i]));
      // find image of user.. images/Phonenumber..
      try {
        final ref = await firebaseStorage
            .ref("images")
            .child(data.toList()[i])
            .getDownloadURL();
        ContactsDetails contactsDetails = ContactsDetails(
          contactName: findKeyByValue(phoneAndName, data.toList()[i]),
          contactImagePath: ref,
          phonenumber: data.toList()[i],
        );
        sendDataToUI.add(contactsDetails);
      } catch (e) {
        if (e.toString() ==
            "FirebaseException ([firebase_storage/object-not-found] No object exists at the desired reference.)") {
          print("user don'thave phone number");
        }
      }
    }
    postDataToUI();
  }

  //Method to get name of contact out of phone number.
  // Get name out of phone func.
  String findKeyByValue(Map<String, String> map, String value) {
    return map.keys.firstWhere(
      (element) => map[element] == value,
    );
  }

  @override
  Sink get phoneContactsModelInputsObjects => _streamController.sink;

  @override
  Stream get phoneContactsModelOutPutsObject =>
      _streamController.stream.map((event) => event);
}

abstract mixin class PhoneContactsModelInputs {
  Sink get phoneContactsModelInputsObjects;
}

abstract mixin class PhoneContactsModelOutPuts {
  Stream get phoneContactsModelOutPutsObject;
}
