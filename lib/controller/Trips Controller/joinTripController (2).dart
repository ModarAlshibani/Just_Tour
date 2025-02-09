import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/view/screens/TeamUI/teamNavbar.dart';
import 'package:JustTour/view/screens/Trips/tripDetailsScreenUser%20(2).dart';
import 'package:JustTour/view/screens/navbar.dart';

abstract class JoinTripController extends GetxController {
  // reserve(int id);
}

class JoinTripControllerImp extends JoinTripController {
  GlobalKey<FormState> formStateJoin = GlobalKey<FormState>();
  late TextEditingController Count;
  late TextEditingController names;
  late List<String> Names;

  Future<void> reserve(int id) async {
    // For me to check if the data I'm sending
    print("Count: ${Count.text}");
    print("names: ${names.text}");
    print(
        "ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
    print(Get.find<GlobalStateController>().getToken());
    Names = names.text.split(',');
    print(Names);

    final Map<String, dynamic> body = {
      "TripId": id,
      "Count": int.parse(Count.text),
      "Names": names.text,
    };
    // print("Request body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(API.reserveTrip),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },

        body: jsonEncode(body), // Convert the body to a JSON string
      );
      print(Get.find<GlobalStateController>().getToken());
      final jsonResponse = jsonDecode(response.body);
      print(
          "====================================================================");
      print(jsonResponse["Message"]);
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(
            "=========Status code 200 ========================================================");
        print("Reservation successful");
        print(jsonResponse["Message"]);

        Get.dialog(
          AlertDialog(
            title: Text("Reservation Completed!"),
            content: Text(
              "hope to have a great experience",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Get.to(TripDetailsScreenUser(
                  id: id,
                )),
              ),
            ],
          ),
        );

        // Get.back();
      } else {
        print("Failed to Reserve a trip");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        // String errorMessage = responseBody['Message'] ?? "errepihikugutyfytdyh";
        print(
            "====================================================================");

        Get.dialog(
          AlertDialog(
            title: Text("Reservation Failed"),
            content: Text(
              jsonResponse['Message'],
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
      print("Error during Rrservation: $error");
    }
  }

  Future<void> CancelReservation(int? id) async {
    final Map<String, dynamic> body = {
      "TripId": id,
    };

    try {
      final response = await http.post(
        Uri.parse(API.cancelReservation),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },

        body: jsonEncode(body), // Convert the body to a JSON string
      );

      final jsonResponse = jsonDecode(response.body);
      print(
          "====================================================================");
      // print(jsonResponse["Status"]);

      if (response.statusCode == 200 && jsonResponse["status"] == true) {
        print("Need Confirmation");
        print(jsonResponse["Message"]);
        print("The generated key is:");
        print(jsonResponse['data']['generatedKey']);
        Get.dialog(
          AlertDialog(
            title: Text("Cancel Reservation"),
            content: Text(
              jsonResponse["message"],
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("Yes"),
                onPressed: () {
                  Get.back();
                  ConfermCancelReservation(
                      jsonResponse['data']['generatedKey'], id);
                  print("now we need to Confirm");
                },
              ),
              TextButton(
                child: Text("No"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );

        // Get.back();
      } else {
        print("Failed to cancel your reservation");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";
        print(
            "====================================================================");

        Get.dialog(
          AlertDialog(
            title: Text("Cancelation Failed"),
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
      print("Error during Rrservation: $error");
    }
  }

  Future<void> ConfermCancelReservation(String key, int? id) async {
    final Map<String, dynamic> body = {
      "generatedKey": key,
    };

    try {
      final response = await http.post(
        Uri.parse(API.confirmCancelReservation),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },

        body: jsonEncode(body), // Convert the body to a JSON string
      );

      final jsonResponse = jsonDecode(response.body);
      print(
          "====================================================================");
      // print(jsonResponse["Status"]);

      if (response.statusCode == 200 && jsonResponse["status"] == true) {
        print(jsonResponse["Message"]);

        Get.dialog(
          AlertDialog(
            title: Text("Done!"),
            content: Text(
              jsonResponse["message"],
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                  Get.to(Navbar());
                },
              ),
            ],
          ),
        );

        // Get.back();
      } else {
        print("Failed to cancel your reservation");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";
        print(
            "====================================================================");
        Get.dialog(
          AlertDialog(
            title: Text("Cancelation Failed"),
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
      print("Error during Rrservation: $error");
    }
  }

  // @override
  // void Join(int id) {
  //   var formData = formStateJoin.currentState;
  //   reserve(id);
  // }

  @override
  void onInit() {
    Count = TextEditingController();
    names = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    Count.dispose();
    names.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
