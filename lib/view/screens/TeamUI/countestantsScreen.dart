import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Team%20Controllers/showCountestantsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/userModel.dart';

class CountestantsScreen extends StatefulWidget {
  final int? id;

  const CountestantsScreen({super.key, this.id});

  @override
  State<CountestantsScreen> createState() => _CountestantsScreenState();
}

late Future<List<User>?> users;

class _CountestantsScreenState extends State<CountestantsScreen> {
  @override
  void initState() {
    users = CountestantsController().getCountestants(widget.id);
  }

  Widget build(BuildContext context) {
    users = CountestantsController().getCountestants(widget.id);

    return Scaffold(
        backgroundColor: AppColors.grey,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.midnightGreen,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.grey,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Countestants",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmoke,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
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
            ),
          ],
        ));
  }
}

Widget CountestantsWidget(AsyncSnapshot<List<User>?> consInfo) =>
    ListView.builder(
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      scrollDirection: Axis.vertical,
      itemCount: consInfo.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        User user = consInfo.data![index];

        return Container(
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
