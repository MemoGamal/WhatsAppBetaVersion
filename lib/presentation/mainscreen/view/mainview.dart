import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:whatsappclonememo/app/constants.dart';
import 'package:whatsappclonememo/presentation/callscreen/view/callview.dart';
import 'package:whatsappclonememo/presentation/chatscreen/view/chatscreenview.dart';
import 'package:whatsappclonememo/presentation/communityscreen/view/communityview.dart';
import 'package:whatsappclonememo/presentation/mainscreen/model/mainscreenmodel.dart';
import 'package:whatsappclonememo/presentation/storyscreen/view/storyview.dart';
import 'package:whatsappclonememo/resources/color_manager/colormanager.dart';
import 'package:whatsappclonememo/resources/sizes_manager.dart';
import 'package:whatsappclonememo/resources/strings_manager/stringmanager.dart';
import 'package:whatsappclonememo/resources/value_manager/value_manager.dart';

Mainscreenmodel mymainscreenmodel = Mainscreenmodel();
GlobalKey mykey = GlobalKey();

class Mainview extends StatefulWidget {
  const Mainview({super.key});

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomBarIcons(context, _currentIndex),
      body: PageView.builder(
        controller: mymainscreenmodel.pageController,
        itemCount: Constants.numberOfScreens,
        onPageChanged: (value) {
          _currentIndex = value;
          setState(() {
            _currentIndex;
          });
        },
        itemBuilder: (context, index) {
          return bodyNavigator(index);
        },
      ),
    );
  }
}

Widget bottomBarIcons(context, currentIndex) {
  return Container(
    width: SizesManager(context: context).width,
    height: SizesManager(context: context).height01,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSize.s20),
      shape: BoxShape.rectangle,
    ),
    child: GNav(
      selectedIndex: currentIndex,
      backgroundColor: Colormanager.thewhitecolor,
      padding: const EdgeInsets.all(AppSize.s10),
      tabMargin: const EdgeInsets.only(
        left: AppMargin.m10,
        right: AppMargin.m10,
      ),
      iconSize: AppSize.s30, // tab button icon size
      rippleColor: Colormanager.homeviewImagebackGroundColor
          .withOpacity(0.7), // tab button ripple color when pressed
      tabBackgroundColor: Colormanager
          .homeviewImagebackGroundColor, // selected tab background color
      gap: 8, // the tab button gap between icon and text
      onTabChange: (value) {
        // Edit here to naviagate..
        // pageController.animateToPage(
        //   mymainscreenmodel.bottombarButtonTap(value),
        // );
        mymainscreenmodel.bottombarButtonTap(value);
        currentIndex = value;
      },

      tabs: const [
        GButton(
          icon: Icons.message_sharp,
          iconSize: 24,
          text: Stringmanager.messages,
        ),
        GButton(
          icon: Icons.wechat_sharp,
          text: Stringmanager.status,
        ),
        GButton(
          icon: Icons.people_alt_outlined,
          text: Stringmanager.community,
        ),
        GButton(
          icon: Icons.call_outlined,
          text: Stringmanager.call,
        ),
      ],
    ),
  );
}

Widget bodyNavigator(int index) {
  if (index == 0) {
    return const Chatscreenview();
  }
  if (index == 1) {
    return const Storyview();
  }
  if (index == 2) {
    return const Communityview();
  }
  if (index == 3) {
    return const Callview();
  } else {
    return Container();
  }
}
