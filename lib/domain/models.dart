import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Country {
  const Country({
    required this.phoneCodeNumber,
    required this.nameofCountry,
  });
  final String nameofCountry;
  final String phoneCodeNumber;
}

class CountryPhoneNumber {
  const CountryPhoneNumber({
    required this.mycountry,
    required this.phoneNumber,
    this.theerrorMessage,
  });
  final Country mycountry;
  final String phoneNumber;
  final String? theerrorMessage;
}

class UserDetails {
  const UserDetails({
    required this.countryPhoneNumber,
    required this.userName,
    required this.userImagePathOnFireBase,
    this.imageFile,
  });

  final CountryPhoneNumber countryPhoneNumber;
  final String userName;
  final String userImagePathOnFireBase;
  final File? imageFile;
}

class ChatUsersDetails {
  final String personName;
  final File personImage;
  final String lastSentMessage;
  final String lastSentMessageTime;
  final bool? isread;
  ChatUsersDetails({
    required this.personName,
    required this.personImage,
    required this.lastSentMessage,
    required this.lastSentMessageTime,
    this.isread,
  });
}

class ContactsDetails {
  final String contactName;
  final String contactImagePath;
  final String phonenumber;

  ContactsDetails({
    required this.contactName,
    required this.contactImagePath,
    required this.phonenumber,
  });
}

class Message {
  final String senderid;
  final String senderPhonenumber;
  final String receiverPhoneNumber;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.senderid,
    required this.senderPhonenumber,
    required this.receiverPhoneNumber,
    required this.message,
    required this.timestamp,
  });
  // convert to map ..
  Map<String, dynamic> tomap() {
    return {
      "sender iD": senderid,
      "senderPhonenumber": senderPhonenumber,
      "receiveID": receiverPhoneNumber,
      "message": message,
      "time": timestamp,
    };
  }
}
