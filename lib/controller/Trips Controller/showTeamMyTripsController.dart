import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:terez/APIs.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/Trips/tripDetailsScreenUser%20(2).dart';


class TeamMyTripsController extends GetxController {
  Future<List<TripModel>?> getMyTrips() async {
    try {
      print('in get');
      var url = Uri.parse(API.teamsMyTrips);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('trip');
      print(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        print("object");
        List<TripModel> _model = TripListFromJson(response.body);
        print("object");
        print('Parsed model count: ${_model.length}');
        print("object");
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}  