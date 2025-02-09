// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:JustTour/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/view/screens/TeamUI/teamNavbar.dart';

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
  File? TripPhoto;
  late TextEditingController RetrieveEndDate;
  late TextEditingController Percent;

  Future<http.Response> uploadSingleImage({
    required String url,
    required String imagepath,
    required Map<String, String> fields,
    required Map<String, String> headers,
    required File? imageFile,
  }) async {
    // Correctly parse the URL into a Uri
    final uri = Uri.parse(url);

    var request = http.MultipartRequest('POST', uri);
    if (imageFile != null) {
      request.files
          .add(await http.MultipartFile.fromPath(imagepath, imageFile.path));
    }

    request.headers.addAll(headers);
    request.fields.addAll(fields);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    // Check for successful upload
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception('Failed to upload image: ${response.reasonPhrase}');
    }
  }

  Future<void> AddTrip() async {
    final Map<String, String> body = {
      "Title": Title.text,
      "Location": Location.text,
      "StartDate": DateTime.parse(StartDate.text).toIso8601String(),
      "EndDate": DateTime.parse(EndDate.text).toIso8601String(),
      "StartBooking": DateTime.parse(StartBooking.text).toIso8601String(),
      "EndBooking": DateTime.parse(EndBooking.text).toIso8601String(),
      "Type": Type.text.toString(),
      "Level": Level.text.toString(),
      "SubLimit": int.parse(SubLimit.text).toString(),
      "Cost": int.parse(Cost.text).toString(),
      "Description": Description.text,
      "Retrieve": Retrieve.text,
      "Requirements": Requirements.text,
      "RetrieveEndDate": DateTime.parse(RetrieveEndDate.text).toIso8601String(),
      "Percent": int.parse(Percent.text).toString(),
    };

    try {
      final response = await uploadSingleImage(
        fields: body,
        headers: {
          "Accept": "application/json",
          "Content-Type":
              "multipart/form-data", // Adjust Content-Type accordingly
          "Authorization":
              "Bearer ${Get.find<GlobalStateController>().getToken()}",
        },
        imagepath: 'TripPhoto', // Ensure this matches the server's expectation
        url: Uri.parse(API.addTrip)
            .toString(), // Make sure API.addTrip is a valid URL
        imageFile: TripPhoto,
      );
      print(response.statusCode);

      final jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200 && jsonResponse["status"] == true) {
        print(jsonResponse["message"]);
        Get.to(TeamNavbar());
      } else {
        final responseBody = jsonDecode(response.body);
        String errorMessage =
            responseBody['message'] ?? "An unknown error occurred";
        Get.dialog(
          AlertDialog(
            title: Text("Adding Trip Failed"),
            content: Text(errorMessage),
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
    // TripPhoto = TextEditingController();
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
    // TripPhoto.dispose();
    RetrieveEndDate.dispose();
    Percent.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
