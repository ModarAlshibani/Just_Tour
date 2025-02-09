import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/auth/login_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/constant/imageAssets.dart';
import 'package:JustTour/core/functions/validInput.dart';
import 'package:JustTour/view/widgets/auth/customTextFormField.dart';
import 'package:JustTour/view/widgets/auth/loginButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        body: Form(
      key: controller.formStateLogin,
      child: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Image.asset(
                  imageAsset.rabee,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    AppColors.blackCurrant,
                    AppColors.blackCurrant.withOpacity(0.9),
                    AppColors.blackCurrant.withOpacity(0.8),
                    AppColors.blackCurrant.withOpacity(0.7),
                    AppColors.blackCurrant.withOpacity(0),
                    AppColors.blackCurrant.withOpacity(0),
                    AppColors.blackCurrant.withOpacity(0),
                  ])),
            )),
            Positioned(
              bottom: 230,
              child: Container(
                width: 400,
                height: 100,
                decoration: const BoxDecoration(),
                child: CustomTextFormField(
                  valid: (val) {
                    return validInput(
                      val!,
                      8,
                      100,
                      "email",
                    );
                  },
                  icon: Icon(Icons.email_outlined),
                  label: "LTF1".tr,
                  hint: "E-mail@gmail.com",
                  myController: controller.email,
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
              bottom: 355,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LTitle".tr,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 140,
              child: InkWell(
                  onTap: () {
                    Get.toNamed("/forgetPassword");
                  },
                  child: Text(
                    "LForgett".tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.paleGold,
                        fontSize: 15),
                  )),
            ),
            Positioned(
                right: 30,
                left: 30,
                bottom: 125,
                child: AuthCustomButton(
                  text: "LButton1".tr,
                  onPressed: () {
                    controller.login();
                  },
                )),
            Positioned(
                bottom: 80,
                left: 40,
                right: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LDont".tr,
                      style:
                          TextStyle(color: AppColors.whiteSmoke, fontSize: 18),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                        onTap: () {
                          controller.goToSignup();
                        },
                        child: Text(
                          "LSignup".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.paleGold,
                                  fontSize: 15),
                        )),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
