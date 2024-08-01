import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/APIs.dart';
import 'package:terez/controller/auth/Token.dart';

abstract class SignupController extends GetxController {
  SignUp1();
  showErrorDialog(BuildContext context, String errorMessage);
}

class SignupControllerImp extends SignupController {
  GlobalKey<FormState> formStateSign1 = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phone;
  late TextEditingController firstName;
  late TextEditingController secondName;
  late TextEditingController yearOfBirth;

// Inside your SignupControllerImp class

  void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Failed"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> signUpUser() async {
    // For me to check if the data I'm sending is right
    print("Email: ${email.text.toString()}");
    print("Password: ${password.text.toString()}");
    print("firstname: ${firstName.text.toString()}");
    print("secondname: ${secondName.text.toString()}");
    print("Password: ${password.text.toString()}");
    print("Passwordconferm: ${confirmPassword.text.toString()}");
    print("year: ${yearOfBirth.text.toString()}");

    // if (email.text.isEmpty ||
    //     password.text.isEmpty ||
    //     confirmPassword.text.isEmpty ||
    //     phone.text.isEmpty ||
    //     firstName.text.isEmpty ||
    //     secondName.text.isEmpty ||
    //     yearOfBirth.text.isEmpty) {
    //   print("One or more fields are empty.");
    //   return;
    // }

    final Map<String, dynamic> body = {
      'Email': email.text,
      'Password': password.text,
      'Password_confirmation': confirmPassword.text,
      'Number': phone.text,
      'FirstName': firstName.text,
      'LastName': secondName.text,
      'Age': int.tryParse(yearOfBirth.text) ?? 21,
    };
    print("Request body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(API.signup),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(body), // Convert the body to a JSON string
      );
      if (response.statusCode == 200) {
        print("Registration successful");
        // Parse the response JSON
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse["Message"]);
        // Optionally, store the token received in the response
        String? token = jsonResponse['Token'];
        print(token);
        Get.put(GlobalStateController());
        Get.find<GlobalStateController>().setToken(token);
        print("token setted successfully");
        // Navigate to the next screen or update UI as needed
        Get.toNamed('/nav');
      } else {
        print("Failed to register");
        print(response.statusCode);
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'];

        Get.dialog(
          AlertDialog(
            title: Text("Registration Failed"),
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
      print("Error during registration: $error");
    }
  }

  @override
  SignUp1() {
    var formData1 = formStateSign1.currentState;
    if (formData1!.validate()) {
      print("Validated");
      signUpUser();
    } else {
      print("not Valid Data");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phone = TextEditingController();
    firstName = TextEditingController();
    secondName = TextEditingController();
    yearOfBirth = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    phone.dispose();
    firstName.dispose();
    secondName.dispose();
    yearOfBirth.dispose();

    super.dispose();
  }
}
