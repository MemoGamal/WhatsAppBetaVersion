import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/chatscreen/view/chatscreenview.dart';
import 'package:whatsappclonememo/presentation/contactscreen/model/contactscreenmodel.dart';
import 'package:whatsappclonememo/presentation/contactscreen/widgets/newcontact.dart';
import 'package:whatsappclonememo/presentation/messagescreen/view/messageview.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Contactscreenview extends StatefulWidget {
  const Contactscreenview({super.key});

  @override
  State<Contactscreenview> createState() => _ContactscreenviewState();
}

PhoneContactsModel phoneContactsModelInstance = PhoneContactsModel();

class _ContactscreenviewState extends State<Contactscreenview> {
  @override
  void initState() {
    super.initState();
    phoneContactsModelInstance.start();
  }

  @override
  void dispose() {
    phoneContactsModelInstance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: phoneContactsModelInstance.phoneContactsModelOutPutsObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ui(snapshot.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget ui(data) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: AppMargin.m10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Stringmanager.selectcontacts,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.s20,
                ),
              ),
              // Edit this..
              Text(
                "${data.length}${Stringmanager.contacts}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppSize.s16,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: SizesManager(context: context).width40,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: AppSize.s30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: AppSize.s30,
            ),
          ),
        ],
      ),
      //body.........................................................
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New group..
            const Newcontact(
              theicon: Icons.people,
              thetext: Stringmanager.newgroup,
            ),
            // New Contact..
            const Newcontact(
              theicon: Icons.person_add_alt_1_rounded,
              thetext: Stringmanager.newcontact,
            ),
            // New community..
            const Newcontact(
              theicon: Icons.groups,
              thetext: Stringmanager.newcommunity,
            ),
            // text..
            Text(
              Stringmanager.contactsonwhatsapp,
              style: TextStyle(
                fontSize: SizesManager(context: context).width04,
              ),
            ),
            // Edit this..
            // // Contacts list
            SizedBox(
              width: SizesManager(context: context).width,
              height: SizesManager(context: context).height50,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Messageview(
                              phonenumber: data[index].phonenumber,
                              userName: data[index].contactName,
                              photoOfUser: data[index].contactImagePath,
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: SizesManager(context: context).width15,
                          height: SizesManager(context: context).height01,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              data[index].contactImagePath,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizesManager(context: context).width02,
                        ),
                        Text(
                          data[index].contactName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizesManager(context: context).width05,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
