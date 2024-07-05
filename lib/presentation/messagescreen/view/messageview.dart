import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/messagescreen/model/messagemodel.dart';
import 'package:whatsappclonememo/presentation/messagescreen/widgets/message.dart';
import 'package:whatsappclonememo/presentation/messagescreen/widgets/messagetextfield.dart';
import 'package:whatsappclonememo/presentation/messagescreen/widgets/sendmessagebutton.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';

MessageModel messageModel = MessageModel();

class Messageview extends StatelessWidget {
  final String phonenumber;
  final String userName;
  final String photoOfUser;
  const Messageview({
    super.key,
    required this.phonenumber,
    required this.userName,
    required this.photoOfUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          Row(
            children: [
              Icon(
                Icons.camera,
                size: SizesManager(context: context).width08,
              ),
              SizedBox(
                width: SizesManager(context: context).width05,
              ),
              Icon(
                Icons.call,
                size: SizesManager(context: context).width08,
              ),
              SizedBox(
                width: SizesManager(context: context).width05,
              ),
              Icon(
                Icons.settings,
                size: SizesManager(context: context).width08,
              ),
            ],
          ),
        ],
        // leading size..
        leadingWidth: SizesManager(context: context).width50,
        // leading
        leading: Row(
          children: [
            SizedBox(
              width: SizesManager(context: context).width15,
              height: SizesManager(context: context).height01,
              child: CircleAvatar(
                backgroundImage: NetworkImage(photoOfUser),
              ),
            ),
            Text(
              userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizesManager(context: context).width05,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          buildmessageList(phonenumber),
          const Spacer(),
          Row(
            children: [
              const Messagetextfield(),
              // Message Button..
              SendmessageButton(
                phonenumber: phonenumber,
              ),
            ],
          ),
        ],
      ),
    );

//     //messages..
//     //bottombar..
//     // textfield.. and voice note ..
//     // ),

//     // body
// //       body: SingleChildScrollView(
// //         controller: Injections.messagemodelInjection.scrollController,
// //         child: SizedBox(
// //           height: SizesManager(context: context).height90,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               buildmessageList(phonenumber),

// //               // Messages..
// //               Messagetextfield(thephonenumber: phonenumber),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // Build message list..
  }
}

Widget buildmessageList(String phonenumber) {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  return StreamBuilder(
    stream: messageModel.getmessage(
      firebaseAuth.currentUser!.phoneNumber,
      phonenumber,
    ),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return Text("We had an error ${snapshot.error}");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("loading..");
      } else {
        return SizedBox(
          width: SizesManager(context: context).width,
          height: SizesManager(context: context).height70,
          child: ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var alignment = snapshot.data.docs[index]['sender iD'] ==
                      firebaseAuth.currentUser!.uid
                  ? Alignment.centerRight
                  : Alignment.centerLeft;
              var messageColor = snapshot.data.docs[index]['sender iD'] ==
                      firebaseAuth.currentUser!.uid
                  ? Colormanager.homeviewImagebackGroundColor
                  : Colormanager.chatTextFormFieldTextBackgroundColor;
              return Container(
                alignment: alignment,
                child: Column(
                  children: [
                    TheMessage(
                      thecolor: messageColor,
                      themessage: snapshot.data.docs[index]["message"],
                      timeofthemessageInHours:
                          (snapshot.data.docs[index]["time"] as Timestamp)
                              .toDate()
                              .hour
                              .toString(),
                      timeofthemessageInMinutes:
                          (snapshot.data.docs[index]["time"] as Timestamp)
                              .toDate()
                              .minute
                              .toString(),
                    ),
                    SizedBox(
                      height: SizesManager(context: context).height001,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    },
  );
}
