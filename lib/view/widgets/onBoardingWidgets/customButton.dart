import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/onBoarding_Controller.dart';
import 'package:JustTour/core/constant/appColors.dart';

class customButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const customButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      height: 55,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            controller.next();
          },
          color: AppColors.rumSwizzle,
          child: Icon(
            Icons.arrow_right_alt,
            size: 40,
            color: AppColors.blackCurrant,
          )),
    );
  }
}
