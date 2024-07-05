import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/base/baseviewmodel.dart';

class Mainscreenmodel extends BaseViewModel
    with MainscreenmodelInput, MainscreenmodelOutPut {
  final StreamController _streamController = StreamController();
  final PageController pageController = PageController();

  @override
  void start() {
    // TODO: implement start
  }
  @override
  void dispose() {
    _streamController.close();
  }

  // Method to control pageview by bottombar.
  @override
  bottombarButtonTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Sink get mainscreenmodelInputObject => _streamController.sink;

  @override
  Stream get mainscreenmodelOutPutObject =>
      _streamController.stream.map((event) => event);
}

abstract mixin class MainscreenmodelInput {
  bottombarButtonTap(int index);
  Sink get mainscreenmodelInputObject;
}

abstract mixin class MainscreenmodelOutPut {
  Stream get mainscreenmodelOutPutObject;
}
