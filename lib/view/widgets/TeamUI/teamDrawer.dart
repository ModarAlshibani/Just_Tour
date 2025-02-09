import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/auth/login_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/view/screens/auth/language.dart';

class TeamDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 300,
      color: AppColors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            width: 300,
            child: ListView(
              children: [
                ListTile(
                  onTap: () => Get.to(Language()),
                  leading: Icon(
                    Icons.language,
                  ),
                  title: Text(
                    "Language",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.find<LoginControllerImp>().logout();
                  },
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
