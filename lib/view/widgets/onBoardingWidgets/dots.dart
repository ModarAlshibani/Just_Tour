import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/onBoarding_Controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/dataSource/statics/static.dart';

class DotsOnBoarding extends StatelessWidget {
  const DotsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<OnBoardingControllerImp>(
          builder: ((controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      onBoardingList.length,
                      (index) => AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 700,
                            ),
                            margin: const EdgeInsets.only(right: 5),
                            width: controller.currentPage == index ? 30 : 15,
                            height: controller.currentPage == index ? 3 : 1,
                            decoration: BoxDecoration(
                                color: AppColors.varidiantGreen,
                                borderRadius: BorderRadius.circular(1)),
                          ))
                ],
              ))),
    );
  }
}
