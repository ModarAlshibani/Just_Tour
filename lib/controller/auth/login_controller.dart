import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terez/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/view/screens/TeamUI/teamNavbar.dart';
import 'package:terez/view/screens/auth/login.dart';
import 'package:terez/view/screens/navbar.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  Future<void> loginUser() async {
    // For me to check if the data I'm sending
    print("Email: ${email.text.toString()}");
    print("Password: ${password.text.toString()}");

    final Map<String, dynamic> body = {
      "Email": email.text,
      "Password": password.text,
    };
    print("Request body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(API.login),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(body), // Convert the body to a JSON string
      );
      final jsonResponse = jsonDecode(response.body);
      print("status is: ");
      print(jsonResponse["status"]);

      if (response.statusCode == 200 && jsonResponse["status"] == true) {
        print("Login successful");
        // Parse the response JSON

        print(jsonResponse["message"]);
        // Optionally, store the token received in the response
        String? token = jsonResponse['token'];

        //Print the Token (Checking)
        print(token);

        Get.find<GlobalStateController>().setToken(token);
        print("token after Login setted successfully");
        print(Get.find<GlobalStateController>().getToken());
        // Navigate to the next screen or update UI as needed
        if (jsonResponse["isUser"] == true) {
          Get.to(Navbar());
        } else {
          Get.to(TeamNavbar());
        }
      } else {
        print("Failed to register");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? "Error Occured";

        Get.dialog(
          AlertDialog(
            title: Text("Login Failed"),
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
      print("Error during Login: $error");
    }

    try {
    final response = await http.post(
      Uri.parse(API.login),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(body),
    );
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && jsonResponse["status"] == true) {
      print("Login successful");
      
      String? token = jsonResponse['token'];
      print(token);

      // Save login status and token to Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('token', token!);

      // Update global state or navigate as needed
      Get.find<GlobalStateController>().setToken(token);
      print("token after Login setted successfully");
      print(Get.find<GlobalStateController>().getToken());

      if (jsonResponse["isUser"] == true) {
        Get.to(Navbar());
      } else {
        Get.to(TeamNavbar());
      }
    } else {
      // Handle failure...
    }
  } catch (error) {
    print("Error during Login: $error");
  }
  }

  @override
  login() {
    var formData = formStateLogin.currentState;
    if (formData!.validate()) {
      loginUser();
      print("Validated");
    } else {
      print("not Valid Data");
    }
  }

  @override
  goToSignup() {
    Get.toNamed("signup1");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    //checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  if (isLoggedIn) {
    String? token = prefs.getString('token');
    Get.find<GlobalStateController>().setToken(token);

  /////////////////////////// for the route when HotRestart ///////////////////////////
     final response = await http.get(
      Uri.parse(API.login),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    final jsonResponse = jsonDecode(response.body);
    if (jsonResponse["isUser"] == true) {
        Get.to(Navbar());
      } else {
        Get.to(TeamNavbar());
      }
  }
}

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  Future<void> logout() async {
    print("object");
  // Clear the saved token and login status from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('isLoggedIn');

  // Navigate back to the login screen or another appropriate screen
  SystemNavigator.pop(); // Replace LoginScreen() with your actual login screen widget
}



}