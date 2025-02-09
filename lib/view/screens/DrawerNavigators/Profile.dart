import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:JustTour/controller/ProfileControllers/userProfileController.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/constant/imageAssets.dart';
import 'package:JustTour/core/shared/widgets/backButton.dart';
import 'package:JustTour/data/model/userModel.dart';
import 'package:JustTour/view/widgets/TeamUI/AddTripField.dart';
import 'package:JustTour/view/widgets/TeamUI/editField.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

late Future<User?> user;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    user = UserControllerImp().getCurrentUserProfile();
  }

  Uint8List? _image;

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No Images Selected");
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(
      () {
        _image = img;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserControllerImp controller = Get.put(UserControllerImp());
    user = UserControllerImp().getCurrentUserProfile();

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: FutureBuilder<User?>(
        future: user,
        builder: (context, userInfo) {
          if (userInfo.hasData) {
            return getUserProfile(userInfo);
          } else if (userInfo.hasError) {
            return Text("${userInfo.error}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

UserControllerImp controller = Get.put(UserControllerImp());
Widget getUserProfile(AsyncSnapshot<User?> userInfo) => Stack(
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: AppColors.midnightGreen,
          ),
        ),
        Positioned(
          top: 45,
          right: 15,
          child: MaterialButton(
            onPressed: () {
              print("bgggh");
              controller.EditUserProfile();
            },
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 97, 60),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: AppColors.whiteSmoke,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.language,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(top: 45, left: 20, child: backButton()),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 60,
                  child: Center(
                    child: Text(
                      "${userInfo.data?.FirstName} ${userInfo.data?.LastName}",
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColors.whiteSmoke,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 220,
            left: 20,
            right: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              color: AppColors.whiteSmoke,
              borderRadius: BorderRadius.circular(
                10,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.midnightGreen,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 8, right: 8),
                      child: EditField(
                        initialText: "${userInfo.data?.FirstName}",
                        leadingIcon: Icon(Icons.person_2_outlined),
                        myController: controller.FirstName,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                        initialText: "${userInfo.data?.LastName}",
                        leadingIcon: Icon(Icons.person_2_outlined),
                        myController: controller.LastName,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.midnightGreen,
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.email_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${userInfo.data?.Email}",
                            style: TextStyle(color: AppColors.blackCurrant),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 35),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.midnightGreen,
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${userInfo.data?.Number}",
                            style: TextStyle(color: AppColors.blackCurrant),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 35),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.midnightGreen,
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.wallet_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${userInfo.data?.Wallet}",
                            style: TextStyle(color: AppColors.blackCurrant),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
