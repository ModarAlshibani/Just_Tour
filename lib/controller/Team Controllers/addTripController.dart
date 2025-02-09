// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terez/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/view/screens/TeamUI/teamNavbar.dart';

abstract class AddTripController extends GetxController {
  //addTrip();
}

class AddTripControllerImp extends AddTripController {
  GlobalKey<FormState> formStateAddTrip = GlobalKey<FormState>();

  late TextEditingController Title;
  late TextEditingController Location;
  late TextEditingController StartDate;
  late TextEditingController EndDate;
  late TextEditingController StartBooking;
  late TextEditingController EndBooking;
  late TextEditingController Type;
  late TextEditingController Level;
  late TextEditingController SubLimit;
  late TextEditingController Cost;
  late TextEditingController Requirements;
  late TextEditingController Description;
  late TextEditingController Retrieve;
  late TextEditingController TripPhoto;
  late TextEditingController RetrieveEndDate;
  late TextEditingController Percent;

  Future<void> AddTrip() async {
    // For me to check if the data I'm sending is right
    print("StartDate: ${StartDate.text.toString()}");
    print("EndDate: ${EndDate.text.toString()}");
    print("StartBooking: ${StartBooking.text.toString()}");
    print("EndBooking: ${EndBooking.text.toString()}");
    print("EndBooking: ${RetrieveEndDate.text.toString()}");
    final Map<String, dynamic> body = {
      "Title": Title.text,
      "Location": Location.text,
      "StartDate": DateTime.parse(StartDate.text).toIso8601String(),
      "EndDate": DateTime.parse(EndDate.text).toIso8601String(),
      "StartBooking": DateTime.parse(StartBooking.text).toIso8601String(),
      "EndBooking": DateTime.parse(EndBooking.text).toIso8601String(),
      "Type": Type.text.toString(),
      "Level": Level.text.toString(),
      "SubLimit": int.parse(SubLimit.text),
      "Cost": int.parse(Cost.text),
      "Description": Description.text,
      "Retrieve": Retrieve.text,
      "Requirements": Requirements.text,
      "TripPhoto": TripPhoto.text,
      "RetrieveEndDate": DateTime.parse(RetrieveEndDate.text).toIso8601String(),
      "Percent": int.parse(Percent.text),
    };
    print("Request body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(API.addTrip),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization":
              "Bearer ${Get.find<GlobalStateController>().getToken()}"
        },
        body: jsonEncode(body), // Convert the body to a JSON string
      );
      final jsonResponse = jsonDecode(response.body);
      print("status is: ");
      print(Get.find<GlobalStateController>().getToken());
      print(response.body);
      print(jsonResponse["status"]);

      if (response.statusCode == 200 && jsonResponse["status"] == true) {
        // Parse the response JSON
        print(jsonResponse["message"]);

        // Navigate to the next screen or update UI as needed
        Get.to(TeamNavbar());
      } else {
        print("Failed to add the trip");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "some error";

        Get.dialog(
          AlertDialog(
            title: Text("Adding Trip Failed"),
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
      print("Error during Adding: $error");
    }
  }

  // @override
  // addTrip() {
  //   var formData = formStateAddTrip.currentState;
  // }

  @override
  void onInit() {
    Title = TextEditingController();
    Location = TextEditingController();
    StartDate = TextEditingController();
    EndDate = TextEditingController();
    StartBooking = TextEditingController();
    EndBooking = TextEditingController();
    Type = TextEditingController();
    Level = TextEditingController();
    SubLimit = TextEditingController();
    Cost = TextEditingController();
    Description = TextEditingController();
    Retrieve = TextEditingController();
    Requirements = TextEditingController();
    TripPhoto = TextEditingController();
    RetrieveEndDate = TextEditingController();
    Percent = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  // void setImageFile(XFile? PhotoFile) {
  //   tripPhotoFile = PhotoFile;
  // }

  @override
  void dispose() {
    Title.dispose();
    Location.dispose();
    StartDate.dispose();
    EndDate.dispose();
    StartBooking.dispose();
    EndBooking.dispose();
    Type.dispose();
    Level.dispose();
    SubLimit.dispose();
    Cost.dispose();
    Description.dispose();
    Retrieve.dispose();
    Requirements.dispose();
    TripPhoto.dispose();
    RetrieveEndDate.dispose();
    Percent.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
