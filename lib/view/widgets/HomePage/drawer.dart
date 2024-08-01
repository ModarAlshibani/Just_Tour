import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/screens/DrawerNavigators/myFollowing.dart';
import 'package:terez/view/screens/DrawerNavigators/Log.dart';
import 'package:terez/view/screens/DrawerNavigators/Profile.dart';
import 'package:terez/view/screens/auth/language.dart';

class MyDrawer extends StatelessWidget{

  @override

  Widget build(BuildContext context){

    return Container(
      height: double.infinity,
      width: 300,
      color: AppColors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: double.infinity,
            color: AppColors.midnightGreen,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.midnightGreen,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Ala'a Sehnawi",
                  style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteSmoke,
                                      fontSize: 18),),
                ],
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
                  title: Text("My Profile",
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
                  title: Text("Following",
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
                  title: Text("Log",
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
                  title: Text("Language",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text("Logout",
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