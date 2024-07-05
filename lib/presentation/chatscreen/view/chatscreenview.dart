import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/contactscreen/model/contactscreenmodel.dart';
import 'package:whatsappclonememo/presentation/contactscreen/view/contactscreenview.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Chatscreenview extends StatelessWidget {
  
  const Chatscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.only(left: AppMargin.m10),
          child: Text(
            Stringmanager.whatsApp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSize.s30,
              color: Colormanager.elevatedbuttonBackgroundColor,
            ),
          ),
        ),
        leadingWidth: SizesManager(context: context).width40,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppMargin.m10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    size: AppSize.s30,
                  ),
                ),
                SizedBox(width: SizesManager(context: context).width05),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: AppSize.s30,
                  ),
                ),
                SizedBox(width: SizesManager(context: context).width05),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: AppSize.s30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Chats..
          // SizedBox(
          //   width: SizesManager(context: context).width,
          //   height: SizesManager(context: context).height10,
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return Container();
          //     },
          //   ),
          // ),

          //
          // Message Icon..
          InkWell(
            //overlaycolor to avoid the splash effect on tap..
            overlayColor: WidgetStateColor.transparent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Contactscreenview(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: SizesManager(context: context).height72,
                left: SizesManager(context: context).width80,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppMargin.m10),
                  color: Colormanager.elevatedbuttonBackgroundColor,
                ),
                width: AppSize.s60,
                height: AppSize.s60,
                child: const Icon(
                  Icons.message,
                  size: AppSize.s30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget listofChatsWidget(snapshot, index) {
//   for (var i in snapshot.data.docs[index]["receiveID"]) {
//     print("You got contact");
//   }
//   ;
//   return Container();
// }
