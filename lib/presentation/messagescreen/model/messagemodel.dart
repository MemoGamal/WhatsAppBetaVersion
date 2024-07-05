import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// class Messagemodel {
//   // name of contact..
//   var thenameofContact;
//   //Photo of contact..
//   var tempPhoto;

//   //Signle child scrollview controller...
//   ScrollController scrollController = ScrollController();

//   //Textformfield controller...
//   TextEditingController textformfieldcontroller = TextEditingController();

//   // send message..
//   sendMessage(String receiverPhoneNumber, String message) {
//     final String currentuserID = firebaseAuth.currentUser!.uid;
//     final String currentuserphoneNumber =
//         firebaseAuth.currentUser!.phoneNumber.toString();
//     final Timestamp timestamp = Timestamp.now();

//     //  Create new message..
//     Message newmessage = Message(
//       senderid: currentuserID,
//       senderPhonenumber: currentuserphoneNumber,
//       receiverPhoneNumber: receiverPhoneNumber,
//       message: message,
//       timestamp: timestamp,
//     );

//     // Construct chat room between reciever and sender to acheive principle of uniquiness..
//     List<String> uniquiness = [
//       currentuserphoneNumber.toString().replaceAll("+20", "0"),
//       receiverPhoneNumber
//     ];
//     uniquiness.sort(); // To ensure it's same id for any pair..

//     String chatid = uniquiness.join("_");

//     // add  to firebase firestore ..
//     firebaseFirestore
//         .collection("Users")
//         .doc("Chat")
//         .collection(chatid)
//         .add(
//           newmessage.tomap(),
//         )
//         .catchError((error) {
//       firebaseFirestore
//           .collection("Users")
//           .doc("Chat")
//           .collection(chatid)
//           .doc(chatid)
//           .set(
//             newmessage.tomap(),
//           );
//     });
//   }

//   // Get messages..
//   Stream<QuerySnapshot> getmessage(
//       currentuserphoneNumber, receiverPhoneNumber) {
//     List<String> uniquiness = [
//       currentuserphoneNumber.toString().replaceAll("+20", "0"),
//       receiverPhoneNumber
//     ];
//     uniquiness.sort(); // To ensure it's same id for any pair..
//     String chatid = uniquiness.join("_");

//     return firebaseFirestore
//         .collection("Users")
//         .doc("Chat")
//         .collection(chatid)
//         .orderBy('time', descending: false)
//         .snapshots();
//   }

//   // Get phonename out of value"phone number"
//   String findKeyByValue(Map<String, String> map, String value) {
//     try {
//       return map.keys.firstWhere(
//         (element) => map[element] == value,
//       );
//     } catch (e) {
//       return value;
//     }
//   }
// }

class MessageModel extends BaseViewModel
    with MessageModelInPut, MessageModelOutPut {
  final StreamController _streamController = StreamController();
  final TextEditingController texteditingcontroller = TextEditingController();
  @override
  void start() {
    // TODO: implement start
  }
  @override
  void dispose() {
    _streamController.close();
  }

  // Method to create message..
  createMessage(String receiverPhoneNumber, String message) {
    final String currentuserID = firebaseAuth.currentUser!.uid;
    final String currentuserphoneNumber =
        firebaseAuth.currentUser!.phoneNumber.toString();
    final Timestamp timestamp = Timestamp.now();

    //  Create new message..
    Message newmessage = Message(
      senderid: currentuserID,
      senderPhonenumber: currentuserphoneNumber,
      receiverPhoneNumber: receiverPhoneNumber,
      message: message,
      timestamp: timestamp,
    );
    sendsms(currentuserphoneNumber, receiverPhoneNumber, newmessage);
  }

  // Method to send messages to firebase..
  sendsms(currentuserphoneNumber, receiverPhoneNumber, newmessage) {
    // Construct chat room between reciever and sender to acheive principle of uniquiness..
    List<String> uniquiness = [
      currentuserphoneNumber.toString().replaceAll("+20", "0"),
      receiverPhoneNumber
    ];
    uniquiness.sort(); // To ensure it's same id for any pair..

    String chatid = uniquiness.join("_");

    // add  to firebase firestore ..
    firebaseFirestore
        .collection("Users")
        .doc("Chat")
        .collection(chatid)
        .add(
          newmessage.tomap(),
        )
        .catchError((error) {
      firebaseFirestore
          .collection("Users")
          .doc("Chat")
          .collection(chatid)
          .doc(chatid)
          .set(
            newmessage.tomap(),
          );
    });
  }

  // Method to get messages..
  // Get messages..
  Stream<QuerySnapshot> getmessage(
      currentuserphoneNumber, receiverPhoneNumber) {
    List<String> uniquiness = [
      currentuserphoneNumber.toString().replaceAll("+20", "0"),
      receiverPhoneNumber
    ];
    uniquiness.sort(); // To ensure it's same id for any pair..
    String chatid = uniquiness.join("_");

    return firebaseFirestore
        .collection("Users")
        .doc("Chat")
        .collection(chatid)
        .orderBy('time', descending: false)
        .snapshots();
  }

  @override
  Sink get messageModelInPutObject => _streamController.sink;

  @override
  Stream get messageModelOutPutObject =>
      _streamController.stream.map((event) => event);
}

abstract mixin class MessageModelInPut {
  Sink get messageModelInPutObject;
}

abstract mixin class MessageModelOutPut {
  Stream get messageModelOutPutObject;
}
