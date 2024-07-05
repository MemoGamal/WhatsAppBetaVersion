import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/messagescreen/model/messagemodel.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';

MessageModel messageModel = MessageModel();

class SendmessageButton extends StatelessWidget {
  final String phonenumber;
  const SendmessageButton({super.key, required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizesManager(context: context).width15,
      height: SizesManager(context: context).height10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colormanager.homeviewImagebackGroundColor,
      ),
      child: Center(
        child: messageModel.texteditingcontroller.value.text.isEmpty
            ? InkWell(
                splashFactory: NoSplash.splashFactory,
                child: Icon(
                  Icons.mic,
                  color: Colormanager.theblackcolor,
                  size: SizesManager(context: context).width10,
                ),
              )
            : InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () async {
                  // Send message to firebase..
                  // await Injections.messagemodelInjection.sendMessage(
                  //     phonenumber,
                  //     Injections
                  //         .messagemodelInjection.textformfieldcontroller.text);
                  // // after sending to firebase clear textformfield from value..
                  // //           Injections
                  // Injections.messagemodelInjection.textformfieldcontroller
                  //     .clear();

                  messageModel.createMessage(
                    phonenumber,
                    messageModel.texteditingcontroller.text,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colormanager.theblackcolor,
                  size: SizesManager(context: context).width10,
                ),
              ),
      ),
    );
  }
}
