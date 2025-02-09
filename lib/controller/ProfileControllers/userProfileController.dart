import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'dart:convert';
import 'package:JustTour/data/model/userModel.dart';
import 'package:JustTour/view/screens/DrawerNavigators/Profile.dart';
import 'package:JustTour/view/screens/homePage/homepage.dart';
import 'package:JustTour/view/screens/navbar.dart';

abstract class UserController extends GetxController {}

class UserControllerImp extends UserController {
  ///////////// get user profile ////////////////
  Future<User?> getCurrentUserProfile() async {
    print(
        'Authorization Token: ${Get.find<GlobalStateController>().getToken()}');
    var url = Uri.parse(API.userProfile);
    print(url);
    print("555555555");
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${Get.find<GlobalStateController>().getToken()}',
      },
    );
    print(response);
    print(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print("00");

      print("pppppppp");
      Map<String, dynamic> userData = jsonResponse;
      User user = User.fromJson(userData);
      return user;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load user data');
    }
  }

  ///////// edit user profile ////////////////

  GlobalKey<FormState> formStateUser = GlobalKey<FormState>();

  late TextEditingController FirstName;
  late TextEditingController LastName;
  late TextEditingController Number;

  Future<void> EditUserProfile() async {
    print("First Name: ${FirstName.text}");
    print("First Name: ${LastName.text}");

    final Map<String, dynamic> body = {
      "FirstName": FirstName.text,
      "LastName": LastName.text,
      "Number": Number.text,
    };
    print("Request body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(API.editUserProfile),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${Get.find<GlobalStateController>().getToken()}"
        },
        body: jsonEncode(body),
      );
      final jsonResponse = jsonDecode(response.body);
      print("status is: ");
      print(Get.find<GlobalStateController>().getToken());
      print(response.body);
      print(jsonResponse["Message"]);

      if (response.statusCode == 200) {
        // Parse the response JSON
        print(jsonResponse["Message"]);
        print("new user info:");
        print(jsonResponse["User"]);

        // Navigate to the next screen or update UI as needed
        Get.to(Navbar());
      } else {
        print("Failed to edit the profil");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['Message'] ?? "some error";

        Get.dialog(
          AlertDialog(
            title: Text("Editing Profile Failed"),
            content: Text(
              errorMessage,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Get.back();
                  print("object");
                  print(response.statusCode);
                },
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print("Error during Adding: $error");
    }
  }

  @override
  void onInit() {
    FirstName = TextEditingController();
    LastName = TextEditingController();
    Number = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    FirstName.dispose();
    LastName.dispose();
    Number.dispose();
    super.dispose();
  }
}
