import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Team%20Controllers/showFollowersController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/userModel.dart';
import 'package:JustTour/view/screens/Teams/followingController.dart';

class FollowersList extends StatefulWidget {
  @override
  State<FollowersList> createState() => _FollowersListState();
}

late Future<List<User>?> users;

@override
void initState() {
  users = ShowFollowersController().getFollowersList();
}

class _FollowersListState extends State<FollowersList> {
  @override
  Widget build(BuildContext context) {
    users = ShowFollowersController().getFollowersList();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/teamNav');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.midnightGreen,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 50),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.rumSwizzle,
                        )),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "My Followers",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: double.infinity,
                height: 500,
                color: AppColors.grey,
                child: FutureBuilder(
                    future: users,
                    builder: (context, consInfo) {
                      if (consInfo.hasData) {
                        return CountestantsWidget(consInfo);
                      } else if (consInfo.hasError) {
                        return Text('${consInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CountestantsWidget(AsyncSnapshot<List<User>?> consInfo) =>
    ListView.builder(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      scrollDirection: Axis.vertical,
      itemCount: consInfo.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        User user = consInfo.data![index];
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.midnightGreen),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Text(
                  "User name: ${user.FirstName!} ${user.LastName!}",
                  style:
                      TextStyle(color: AppColors.midnightGreen, fontSize: 15),
                ),
                Text(
                  "Email: ${user.Email!}",
                  style:
                      TextStyle(color: AppColors.midnightGreen, fontSize: 15),
                ),
                Text(
                  "Phone Number: ${user.Number!}",
                  style:
                      TextStyle(color: AppColors.midnightGreen, fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    );
