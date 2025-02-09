import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/auth/Forgetpaswword_Controller/forgetPassword_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/view/widgets/auth/customTextFormField.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColors.blackCurrant,
      body: Container(
        height: 500,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your Email address",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 28),
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              label: "Email",
              hint: "Enter your Email here",
              icon: Icon(Icons.email_outlined),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 330,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  controller.goToVerfiy();
                },
                color: AppColors.rumSwizzle,
                child: Text(
                  "Send verfication code",
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
