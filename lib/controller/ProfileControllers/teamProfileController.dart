import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:terez/APIs.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/data/model/team_model.dart';
import 'dart:convert';
import 'package:terez/data/model/userModel.dart';
import 'package:terez/view/screens/TeamUI/TeamHomepage.dart';
import 'package:terez/view/screens/TeamUI/teamNavbar.dart';
import 'package:terez/view/screens/homePage/homepage.dart';

abstract class TeamProfileController extends GetxController{

}
  
class TeamProfileControllerImp extends TeamProfileController{

  ///////////// get user profile ////////////////
  Future<TeamModel?> getCurrentTeamProfile() async {
    print('Authorization Token: ${Get.find<GlobalStateController>().getToken()}');
    var url = Uri.parse(API.profile);
    print(url);
    print("555555555");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Get.find<GlobalStateController>().getToken()}',
        },
      );
      print(response);
      print(url);
      if (response.statusCode == 200){
        print(response.statusCode);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print(jsonResponse);
        print("00");
        
          print("pppppppp");
        Map<String, dynamic>  teamData = jsonResponse;
        TeamModel team = TeamModel.fromJson(teamData);
        return team;
        
      } else {
        print(response.statusCode);
        throw Exception('Failed to load team data');
      }
    
  }

  ///////// edit team profile ////////////////
  
  GlobalKey<FormState> formStateTeam = GlobalKey<FormState>();

  late TextEditingController Description;
  late TextEditingController ContactInfo;

  Future<void> EditTeamProfile() async{
    print("First Name: ${Description.text}" );
    print("First Name: ${ContactInfo.text}" );

    final Map<String, dynamic> body = {
      "Description" : Description.text,
      "ContactInfo" : ContactInfo.text,
    };
    print("Request body: ${jsonEncode(body)}");

    try{
      final response = await http.post(
        Uri.parse(API.editTeamProfile),
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
        print("new Team info:");
        print(jsonResponse["Team"]);

        // Navigate to the next screen or update UI as needed
        Get.to(TeamNavbar());
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
                onPressed: () { Get.back();
                print("object");
                print(response.statusCode);},
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
    void onInit(){
      Description = TextEditingController();
      ContactInfo = TextEditingController();
      super.onInit();
    }

    @override
    void dispose(){
      Description.dispose();
      ContactInfo.dispose();
      super.dispose();
  }
}