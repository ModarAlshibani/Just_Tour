import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/core/constant/appColors.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 35,
        left: 25,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: AppColors.blackCurrant.withOpacity(0.9),
            ),
          ),
        ));
  }
}
