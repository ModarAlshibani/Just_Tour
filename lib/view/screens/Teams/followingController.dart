import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/view/screens/Teams/teamsScreen.dart';
import 'package:JustTour/view/widgets/Teams/teamDet.dart';

abstract class FollowTeamController extends GetxController {}

class FollowTeamControllerImp extends FollowTeamController {
  Future<void> Follow(int? teamId) async {
    try {
      final response = await http.post(
        Uri.parse(API.follow + teamId.toString()),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 && jsonResponse['status'] == true) {
        print(response.statusCode);
        Get.dialog(
          AlertDialog(
            title: Text("Team Folowed Successfully!"),
            content: Text(
              "hope to have a great experience with this team",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.to(teamsScreen()),
              ),
            ],
          ),
        );
      } else {
        print("Failed to Follow this team");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";

        Get.dialog(
          AlertDialog(
            title: Text("Following Failed"),
            content: Text(
              errorMessage,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print("error in follow : $error");
    }
  }

  Future<void> UnFollow(int? teamId) async {
    try {
      final response = await http.post(
        Uri.parse(API.follow + teamId.toString()),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 && jsonResponse['status'] == true) {
        print(response.statusCode);
        Get.dialog(
          AlertDialog(
            title: Text("Team Unfolowed Successfully!"),
            content: Text(
              "You can follow this team again",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.to(teamsScreen()),
              ),
            ],
          ),
        );
      } else {
        print("Failed to Unfollow this team");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";

        Get.dialog(
          AlertDialog(
            title: Text("Unfollowing Failed"),
            content: Text(
              errorMessage,
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      print("error in follow : $error");
    }
  }
}
