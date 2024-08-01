import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:terez/core/class/statusRequest.dart';
import 'package:terez/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        print("inside the if statement in the crud.dart file");

        var response = await http.post(
            Uri.parse('http://10.0.2.2:8000/api/userRegister'),
            body: data);
        print("urllllllllllllllllllllllllllllllllll");

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          print(response.statusCode);
          var redirectedResponse = await http
              .get(Uri.parse('http://127.0.0.1:8000/api/userRegister'));
          print(
              "Redirected response status code: ${redirectedResponse.statusCode}");

          // Return the redirected response
          Map responseBody = jsonDecode(redirectedResponse.body);
          return Right(responseBody);
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e, stackTrace) {
      print("Error: $e");
      print("Stack Trace: $stackTrace");
      return const Left(StatusRequest.serverException);
    }
  }
}
