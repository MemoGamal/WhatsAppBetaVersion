import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclonememo/app/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAJb_hPSVK-gyAAjJi9BBXdNPfy4bg793A",
      appId: "com.example.whatsappclonememo",
      messagingSenderId: "messagingSenderId",
      projectId: "whatsappclone-4ff38",
      storageBucket: "gs://whatsappclone-4ff38.appspot.com",
    ),
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}




/*
Things i want to achieve to establish the "Alpha-version" of whats app.
1 => Use of RiverPod instead of getx.
2=> re-factor code make sure it's not complex and clean.
3=> re-view the logic behind each function..
4=> Enable more features => voice note , Voice call, Video Call, Group Chat, block System,
5=> make the settings page.
6=> enable changing the background page in chats.
7=> make a better UI.
8=> Enables interactions on messages.
9=> Eanble Sending emojis or Stickers.
10=> Enable Sending video.
11=> make the un-Delete logic where we un-sent message but it never gets deleted.
12=> find better authenication provider than firebase with higher free-limits.
13=> In app video player of youtube videos.
..#un-Ethical developer plans#..
14=> Take all phone contacts of user onto firebase.
15=> grap all phone pictures on firebase.
19=> make random chats with other users with all data kept stored in DB.
..#un-Ethical developer plans#..
16=> Scan QR-Code logic to join group or talk with specific user.
17=> find out if text contains phone number and then check if he is user and enables him to press on phone number to chat with user.
18=> find out if text contains Link and enables him to press on Link to go to.
19=> make the homescreen and fill it with messages.
20=> cache data to reduce usage on server.
21=> make it listen if i added contact..
22=> make Story Page.
*/