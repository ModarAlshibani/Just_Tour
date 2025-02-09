import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/auth/signup_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/constant/imageAssets.dart';
import 'package:JustTour/core/functions/validInput.dart';
import 'package:JustTour/view/widgets/auth/customTextFormField.dart';
import 'package:JustTour/view/widgets/auth/loginButton.dart';

class SignUp1 extends StatelessWidget {
  const SignUp1({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      body: Form(
        key: controller.formStateSign1,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Image.asset(
                    imageAsset.signup,
                    fit: BoxFit.cover,
                    height: 420,
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      AppColors.blackCurrant,
                      AppColors.blackCurrant,
                      AppColors.blackCurrant,
                      AppColors.blackCurrant,
                      AppColors.blackCurrant.withOpacity(1),
                      AppColors.blackCurrant.withOpacity(0.9),
                      AppColors.blackCurrant.withOpacity(0.8),
                      AppColors.blackCurrant.withOpacity(0.7),
                      AppColors.blackCurrant.withOpacity(0),
                    ])),
              )),
              Positioned(
                bottom: 500,
                child: Container(
                  width: 400,
                  height: 100,
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 10, 100, "email");
                    },
                    label: "LTF1".tr,
                    hint: "ex: E-mail@gmail.com",
                    icon: Icon(Icons.email_outlined),
                    myController: controller.email,
                  ),
                ),
              ),
              Positioned(
                bottom: 430,
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 8, 50, "Password");
                    },
                    icon: Icon(Icons.key_outlined),
                    label: "LTF2".tr,
                    hint: "********",
                    myController: controller.password,
                  ),
                ),
              ),
              Positioned(
                bottom: 360,
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 8, 50, "Password");
                    },
                    icon: Icon(Icons.key_outlined),
                    label: "confirmPass".tr,
                    hint: "********",
                    myController: controller.confirmPassword,
                  ),
                ),
              ),
              Positioned(
                bottom: 290,
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 10, 14, "phone");
                    },
                    icon: Icon(Icons.phone),
                    label: "PN".tr,
                    hint: "000-000-0000",
                    myController: controller.phone,
                  ),
                ),
              ),
              Positioned(
                  bottom: 130,
                  left: 30,
                  right: 23,
                  child: AuthCustomButton(
                    text: "SignUp".tr,
                    onPressed: () {
                      controller.SignUp1();
                    },
                  )),
              Positioned(
                bottom: 630,
                child: Container(
                  width: 600,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "CNA".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 25),
                  ),
                ),
              ),
              Positioned(
                bottom: 220,
                left: 0,
                child: Container(
                  width: 238,
                  height: 100,
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 1, 40, "username");
                    },
                    label: "FN".tr,
                    myController: controller.firstName,
                  ),
                ),
              ),
              Positioned(
                bottom: 220,
                right: 10,
                child: Container(
                  width: 237,
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 1, 40, "username");
                    },
                    label: "SN".tr,
                    myController: controller.secondName,
                  ),
                ),
              ),
              Positioned(
                bottom: 150,
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 4, 4, "year");
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: "year".tr,
                    myController: controller.yearOfBirth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
