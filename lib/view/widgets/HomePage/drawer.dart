import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/ProfileControllers/userProfileController.dart';
import 'package:JustTour/controller/auth/login_controller.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/userModel.dart';
import 'package:JustTour/view/screens/DrawerNavigators/myFollowing.dart';
import 'package:JustTour/view/screens/DrawerNavigators/Log.dart';
import 'package:JustTour/view/screens/DrawerNavigators/Profile.dart';
import 'package:JustTour/view/screens/auth/language.dart';
import 'package:JustTour/view/screens/auth/login.dart';

class MyDrawer extends StatefulWidget {
  final int? id;

  const MyDrawer({
    super.key,
    this.id,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

late Future<User?> user;

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    user = UserControllerImp().getCurrentUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    user = UserControllerImp().getCurrentUserProfile();

    return Container(
      child: FutureBuilder(
          future: user,
          builder: (context, userInfo) {
            if (userInfo.hasData) {
              return getUserProfile(userInfo);
            } else if (userInfo.hasError) {
              return Text("${userInfo.error}");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget getUserProfile(AsyncSnapshot<User?> userInfo) => Container(
        height: double.infinity,
        width: 300,
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              color: AppColors.midnightGreen,
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Text(
                  "${userInfo.data?.FirstName} ${userInfo.data?.LastName}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteSmoke,
                      fontSize: 18),
                ),
              ),
            ),
            Container(
              height: 500,
              width: 300,
              child: ListView(
                children: [
                  ListTile(
                    onTap: () => Get.to(Profile()),
                    leading: Icon(
                      Icons.person,
                    ),
                    title: Text(
                      "My Profile",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(MyFollowing()),
                    leading: Icon(
                      Icons.favorite_border,
                    ),
                    title: Text(
                      "Following",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Get.to(Log()),
                    leading: Icon(
                      Icons.list,
                    ),
                    title: Text(
                      "Log",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                    ),
                  ),
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
