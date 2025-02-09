import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/view/screens/DrawerNavigators/Log.dart';
import 'package:JustTour/view/screens/Teams/teamsScreen.dart';
import 'package:JustTour/view/screens/navbar.dart';

abstract class RateController extends GetxController {}

class RateControllerImp extends RateController {
  GlobalKey<FormState> formStateRate = GlobalKey<FormState>();

  Future<void> Rate(int TripId, int Value) async {
    try {
      final response = await http.post(
        Uri.parse(API.rate),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
        body: jsonEncode({
          'Value': Value.toString(),
          'TripId': TripId.toString(),
        }),
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 && jsonResponse['status'] == true) {
        print(response.statusCode);
        Get.dialog(
          AlertDialog(
            title: Text("trip rated Successfully!"),
            content: Text(
              "hope to have a great experience with this trip",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.to(Navbar()),
              ),
            ],
          ),
        );
      } else {
        print("Failed to Rate this trip");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";

        Get.dialog(
          AlertDialog(
            title: Text("Rateing Failed"),
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
      print("error in rate : $error");
    }
  }
}
