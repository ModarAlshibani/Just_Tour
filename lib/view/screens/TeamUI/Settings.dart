import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:JustTour/controller/auth/login_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/teamNav');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteSmoke,
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Get.find<LoginControllerImp>().logout();
              },
              child: Container(
                height: 100,
                width: 500,
                color: AppColors.grey,
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
