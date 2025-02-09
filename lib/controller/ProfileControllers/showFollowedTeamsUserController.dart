import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/team_model.dart';

class ShowFollowedTeams extends GetxController {}

class ShowFollowedTeamsImp extends ShowFollowedTeams {
  List<TeamModel> followedTeamsListFromJson(String str) {
    final jsonResponse = jsonDecode(str);
    final List<dynamic> dataList = jsonResponse['data']['followedTeams'];
    return dataList.map((item) => TeamModel.fromJson(item)).toList();
  }

  Future<List<TeamModel>?> GetFollowedTeams() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.showFollowingTeams);
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
        List<TeamModel> _model = followedTeamsListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
