import 'dart:convert';

import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/userModel.dart';

class ShowFollowersController extends GetxController {
  Future<List<User>?> getFollowersList() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.showTeamFollowers);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<User> _model = FollowersListFromJson(response.body);
        print('Parsed followers model count: ${_model.length}');
        print("-------------");
        print(_model);
        print("-------------");
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
