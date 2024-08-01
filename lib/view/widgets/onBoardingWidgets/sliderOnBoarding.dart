import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/onBoarding_Controller.dart';
import 'package:terez/data/dataSource/statics/static.dart';

class SliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => {controller.onPageChanged(value)},
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Image.asset(
                onBoardingList[index].imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 145,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                onBoardingList[index].title!,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          // Positioned(
          //   child: Text(
          //     onBoardingList[index].body!,
          //     style: Theme.of(context).textTheme.bodyMedium,
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
    );
  }
}
