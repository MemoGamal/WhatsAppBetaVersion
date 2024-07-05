import 'package:cloud_firestore/cloud_firestore.dart';

class Chatscreenmodel {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// get to users chat get current phonenumber chat..
  chatslist(currentuserphoneNumber) {
    return firebaseFirestore
        .collection("users")
        .doc("Chat")
        .collection(currentuserphoneNumber)
        .doc("Chats")
        .snapshots();

    // Getting reciever of message phone number..
    // String receiverPhoneNumber = uniquiness.join("_");
  }
}
