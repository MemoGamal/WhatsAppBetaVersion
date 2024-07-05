import 'package:flutter/material.dart';
import 'package:whatsappclonememo/domain/models.dart';
import 'package:whatsappclonememo/presentation/mainscreen/view/mainview.dart';
import 'package:whatsappclonememo/presentation/userDetails/model/userdetailsmodel.dart';
import 'package:whatsappclonememo/resources/assets_manager/assets_manager.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/injections/injections.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

class Userdetailsview extends StatefulWidget {
  const Userdetailsview({super.key});

  @override
  State<Userdetailsview> createState() => _UserdetailsviewState();
}

class _UserdetailsviewState extends State<Userdetailsview> {
  @override
  void initState() {
    userdetailsModelInstance.start();
    super.initState();
  }

  UserdetailsModel userdetailsModelInstance = UserdetailsModel();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserDetails>(
      stream: userdetailsModelInstance.userdetailsModelOutPutStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: const [Icon(Icons.settings)],
              centerTitle: true,
              title: Text(
                Stringmanager.profileinfo,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    Stringmanager.nameAndPhoto,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s16,
                    ),
                  ),
                ),

                // Image
                const SizedBox(height: AppMargin.m20),
                Center(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () async {
                      userdetailsModelInstance.imagePickerFun(context);
                      // //edit this..
                      // await Injections.userDetailsInjection.imagePickerFun();
                      // setState(() {
                      //   Injections.userDetailsInjection.image;
                      // });
                    },
                    child: Container(
                      width: SizesManager(context: context).width30,
                      height: SizesManager(context: context).height20,
                      decoration: BoxDecoration(
                        color: Colormanager.cameraBackGroundColor,
                        shape: BoxShape.circle,
                      ),
                      //edit this..
                      child: userdetailsModelInstance.image == null
                          ? Image.asset(
                              AssetsManager.cameraviewImage,
                              cacheHeight: SizesManager(context: context)
                                  .height007
                                  .toInt(),
                              cacheWidth: SizesManager(context: context)
                                  .width13
                                  .toInt(),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                // snapshot.data!.imageFile!,
                                userdetailsModelInstance.image!,
                              ),
                            ),
                    ),
                  ),
                ),
                //Text Form Field..
                //edit this..
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizesManager(context: context).width15),
                  child: TextFormField(
                    onChanged: (value) =>
                        userdetailsModelInstance.onChanged(value),
                  ),
                ),
                const Spacer(),
                // Next Button
                InkWell(
                  onTap: () {
                    userdetailsModelInstance.uploadtoFirebase().then(
                          (value) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Mainview(),
                            ),
                          ),
                        );
                  },
                  splashFactory: NoSplash.splashFactory,
                  child: Center(
                    child: Container(
                      width: SizesManager(context: context).width30,
                      height: SizesManager(context: context).height005,
                      decoration: BoxDecoration(
                        color: Colormanager.homeviewImagebackGroundColor,
                        borderRadius: BorderRadius.circular(AppMargin.m20),
                      ),
                      child: const Center(
                        child: Text(
                          Stringmanager.next,
                          style: TextStyle(
                            color: Colormanager.theblackcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
