import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/data/dataSource/statics/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int val);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed('login');
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCirc);
    }
  }

  @override
  onPageChanged(int val) {
    currentPage = val;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
