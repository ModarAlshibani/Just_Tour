import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:terez/APIs.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/data/model/trip_model.dart';

class TripController extends GetxController {
  Future<List<TripModel>?> getTrips() async {
    try {
      print('in get');
      var url = Uri.parse(API.teamShowAllTrips);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print('trip');
      print(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<TripModel> _model = TripListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
