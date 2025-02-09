import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/Trips/tripDetailsScreenUser%20(2).dart';

class TeamMyTripsController extends GetxController {
  Future<List<TripModel>?> getMyTrips() async {
    try {
      var url = Uri.parse(API.teamsMyTrips);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      if (response.statusCode == 200) {
        List<TripModel> _model = TripListFromJson(response.body);

        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ////////////// Get my Trip Details ////////////

  Future<TripModel?> teamGetTripDetails(int? tripId) async {
    var url = Uri.parse(API.teamGetTrip + tripId.toString());
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
      print(jsonResponse['status']);
      print(jsonResponse['message']);
      print(jsonResponse['data']);

      Map<String, dynamic> tripData = jsonResponse['data'];
      TripModel trip = TripModel.fromJson(tripData);

      return trip;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load trip data');
    }
  }

  void goToTripDetails(int? id) {
    Get.to(
      () => TripDetailsScreenUser(
        id: id,
      ),
      arguments: trip,
    );
  }
}
