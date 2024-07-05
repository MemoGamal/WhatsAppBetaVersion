import 'package:flutter/material.dart';

class SizesManager {
  final BuildContext context;
  double width01 = 0;
  double width02 = 0;
  double width03 = 0;
  double width04 = 0;
  double width05 = 0;
  double width06 = 0;
  double width07 = 0;
  double width08 = 0;
  double width10 = 0;
  double width11 = 0;
  double width12 = 0;
  double width13 = 0;
  double width14 = 0;
  double width15 = 0;
  double width18 = 0;
  double width20 = 0;
  double width25 = 0;
  double width26 = 0;
  double width24 = 0;
  double width30 = 0;
  double width35 = 0;
  double width40 = 0;
  double width50 = 0;
  double width55 = 0;
  double width60 = 0;
  double width70 = 0;
  double width80 = 0;
  double width85 = 0;
  double width90 = 0;
  double width = 0;

  // Height
  double height001 = 0;
  double height002 = 0;
  double height003 = 0;
  double height004 = 0;
  double height005 = 0;
  double height006 = 0;
  double height007 = 0;
  double height01 = 0;
  double height08 = 0;
  double height10 = 0;
  double height12 = 0;
  double height15 = 0;
  double height20 = 0;
  double height25 = 0;
  double height30 = 0;
  double height40 = 0;
  double height45 = 0;
  double height50 = 0;
  double height60 = 0;
  double height62 = 0;
  double height63 = 0;
  double height64 = 0;
  double height65 = 0;
  double height66 = 0;
  double height67 = 0;
  double height70 = 0;
  double height75 = 0;
  double height73 = 0;
  double height72 = 0;
  double height80 = 0;
  double height90 = 0;
  double height = 0;
  double height110 = 0;

// Aspect Ratio
  double theAspectRatioBackGroundImageTopSection = 0;
  double theAspectRatioTransparentGlassTopSection = 0;

//ScaleFactor
  double scaleFactorBGIMG = 0;
  SizesManager({required this.context}) {
    width01 = MediaQuery.of(context).size.width * 0.01;
    width02 = MediaQuery.of(context).size.width * 0.02;
    width03 = MediaQuery.of(context).size.width * 0.03;
    width04 = MediaQuery.of(context).size.width * 0.04;
    width05 = MediaQuery.of(context).size.width * 0.05;
    width06 = MediaQuery.of(context).size.width * 0.06;
    width07 = MediaQuery.of(context).size.width * 0.07;
    width08 = MediaQuery.of(context).size.width * 0.08;
    width10 = MediaQuery.of(context).size.width * 0.10;
    width11 = MediaQuery.of(context).size.width * 0.11;
    width12 = MediaQuery.of(context).size.width * 0.12;
    width13 = MediaQuery.of(context).size.width * 0.13;
    width14 = MediaQuery.of(context).size.width * 0.14;
    width15 = MediaQuery.of(context).size.width * 0.15;
    width18 = MediaQuery.of(context).size.width * 0.18;
    width20 = MediaQuery.of(context).size.width * 0.20;
    width25 = MediaQuery.of(context).size.width * 0.25;
    width26 = MediaQuery.of(context).size.width * 0.26;
    width24 = MediaQuery.of(context).size.width * 0.24;
    width30 = MediaQuery.of(context).size.width * 0.30;
    width35 = MediaQuery.of(context).size.width * 0.35;
    width40 = MediaQuery.of(context).size.width * 0.40;
    width50 = MediaQuery.of(context).size.width * 0.50;
    width55 = MediaQuery.of(context).size.width * 0.55;
    width60 = MediaQuery.of(context).size.width * 0.60;
    width70 = MediaQuery.of(context).size.width * 0.70;
    width80 = MediaQuery.of(context).size.width * 0.80;
    width85 = MediaQuery.of(context).size.width * 0.85;
    width90 = MediaQuery.of(context).size.width * 0.90;
    width = MediaQuery.of(context).size.width;

    //Height
    height001 = MediaQuery.of(context).size.height * 0.01;
    height002 = MediaQuery.of(context).size.height * 0.02;
    height003 = MediaQuery.of(context).size.height * 0.03;
    height004 = MediaQuery.of(context).size.height * 0.04;
    height005 = MediaQuery.of(context).size.height * 0.05;
    height006 = MediaQuery.of(context).size.height * 0.06;
    height007 = MediaQuery.of(context).size.height * 0.07;

    height01 = MediaQuery.of(context).size.height * 0.1;
    height08 = MediaQuery.of(context).size.height * 0.08;
    height10 = MediaQuery.of(context).size.height * 0.10;
    height12 = MediaQuery.of(context).size.height * 0.12;
    height15 = MediaQuery.of(context).size.height * 0.15;
    height20 = MediaQuery.of(context).size.height * 0.20;
    height25 = MediaQuery.of(context).size.height * 0.25;
    height30 = MediaQuery.of(context).size.height * 0.30;
    height40 = MediaQuery.of(context).size.height * 0.40;
    height45 = MediaQuery.of(context).size.height * 0.45;
    height50 = MediaQuery.of(context).size.height * 0.50;
    height60 = MediaQuery.of(context).size.height * 0.60;
    height62 = MediaQuery.of(context).size.height * 0.62;
    height63 = MediaQuery.of(context).size.height * 0.63;
    height64 = MediaQuery.of(context).size.height * 0.64;
    height65 = MediaQuery.of(context).size.height * 0.65;
    height66 = MediaQuery.of(context).size.height * 0.66;
    height67 = MediaQuery.of(context).size.height * 0.67;
    height70 = MediaQuery.of(context).size.height * 0.70;
    height75 = MediaQuery.of(context).size.height * 0.72;
    height72 = MediaQuery.of(context).size.height * 0.73;
    height73 = MediaQuery.of(context).size.height * 0.75;
    height80 = MediaQuery.of(context).size.height * 0.80;
    height90 = MediaQuery.of(context).size.height * 0.90;
    height = MediaQuery.of(context).size.height;
    height110 = MediaQuery.of(context).size.height * 1.10;

    //Aspect Ratio..
    theAspectRatioBackGroundImageTopSection = 16 / 7.5;
    theAspectRatioTransparentGlassTopSection = 20 / 8;

    //ScaleFactor
    scaleFactorBGIMG = 1.5;
  }
  static bool ismob = false;
  static checkDeviceInfo(context) {
    if (MediaQuery.of(context).size.width <= 600) {
      ismob = true;
    } else {
      ismob = false;
    }
  }
}
