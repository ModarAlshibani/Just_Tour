import 'package:get/get.dart';
import 'package:terez/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/view/screens/Teams/teamsDetails.dart';

class ShowTeamsController extends GetxController {
  Future<List<TeamModel>?> getTeams() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.showTeamsUser);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('Teams List');
      print(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<TeamModel> _model = TeamsListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //============ Get Team Details =============//


  Future<TeamModel?> userGetTeamDetails(int? teamId) async {
  
    var url = Uri.parse(API.userGetTeam + teamId.toString());
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${Get.find<GlobalStateController>().getToken()}'
      },
    );
    print(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      // If the server returns a 200 OK response, parse the JSON.

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
     // bool isFollowed = jsonResponse['isFollowed'];
      
      print(jsonResponse['status']);
      print(jsonResponse['message']);
      print(jsonResponse['data']);
      print("isFollowed:");
      print(jsonResponse['isFollowed']);
      print(jsonResponse['data']['TeamName']);
      Map<String, dynamic> teamData = jsonResponse['data'];
      TeamModel team = TeamModel.fromJson(teamData);
      return team;
    } else {
      print(response.statusCode);
      
      throw Exception('Failed to load trip data');
    }
    
  }
   

}
