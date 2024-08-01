import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/onBoarding_Controller.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/onBoardingWidgets/customButton.dart';
import 'package:terez/view/widgets/onBoardingWidgets/dots.dart';
import 'package:terez/view/widgets/onBoardingWidgets/sliderOnBoarding.dart';

// ignore: camel_case_types
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColors.rumSwizzle,
      body: Center(
        child: Stack(
          children: [
            const Expanded(
              flex: 3,
              child: SliderOnBoarding(),
            ),
            Positioned(bottom: 130, child: DotsOnBoarding()),
            Positioned(bottom: -50, right: 40, child: customButtonOnBoarding()),
          ],
        ),
      ),
    );
  }
}
