import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/messagescreen/model/messagemodel.dart';
import 'package:whatsappclonememo/presentation/messagescreen/widgets/sendmessagebutton.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Messagetextfield extends StatefulWidget {
  const Messagetextfield({super.key,});

  @override
  State<Messagetextfield> createState() => _MessagetextfieldState();
}

class _MessagetextfieldState extends State<Messagetextfield> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppMargin.m8),
        SizedBox(
          width: SizesManager(context: context).width80,
          child: TextFormField(
            // controller: messageModel.texteditingcontroller,
            // onChanged: (value) {
            //   messageModel.texteditingcontroller.text = value;
            // },
            decoration: InputDecoration(
              fillColor: Colormanager.chatTextFormFieldBackgroundColor,
              filled: true,
              prefixIcon: Icon(
                Icons.emoji_emotions_outlined,
                size: SizesManager(context: context).height004,
              ),
              prefixIconColor:
                  Colormanager.chatTextFormFieldTextBackgroundColor,
              hintText: Stringmanager.message,
              hintStyle: TextStyle(
                color: Colormanager.chatTextFormFieldTextBackgroundColor,
                fontSize: SizesManager(context: context).width05,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colormanager.chatTextFormFieldBackgroundColor),
                borderRadius: BorderRadius.circular(AppPading.p30),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppMargin.m8),
      ],
    );
  }
}
