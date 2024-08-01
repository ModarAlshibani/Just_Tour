import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/core/localization/changeLocalController.dart';
import 'package:terez/view/widgets/language/customLanguageButton.dart';

class Language extends GetView<LocalController> {
  Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Image.asset(
                imageAsset.soil2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "lang".tr,
                    style: TextStyle(color: AppColors.whiteSmoke, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomLanguageButton(
                    text: "English",
                    onPressed: () {
                      controller.changeLang("en");
                      Get.toNamed("/onBoarding");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomLanguageButton(
                    text: "العربية",
                    onPressed: () {
                      controller.changeLang("ar");
                      Get.toNamed("/onBoarding");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
