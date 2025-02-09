import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:JustTour/core/constant/appColors.dart';

class EmailVerfiy extends StatelessWidget {
  const EmailVerfiy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackCurrant,
      body: Container(
        height: 500,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the verfication code we \nsent to your email address",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            OtpTextField(
              textStyle:
                  const TextStyle(color: AppColors.rumSwizzle, fontSize: 25),
              numberOfFields: 5,
              focusedBorderColor: AppColors.paleGold,
              cursorColor: AppColors.paleGold,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 330,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () => Get.toNamed("homePage"),
                color: AppColors.rumSwizzle,
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: AppColors.blackCurrant,
                      fontSize: 16,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
