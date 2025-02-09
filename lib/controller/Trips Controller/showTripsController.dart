import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/Trips/tripDetailsScreenUser%20(2).dart';

class TripController extends GetxController {
  Future<List<TripModel>?> getTrips(String category) async {
    try {
      print('in get');
      var url = Uri.parse(API.showTrips + category);
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
        List<TripModel> _model = TripListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //============ Get Trip Details =============//
  Future<TripModel?> userGetTripDetails(int? tripId) async {
    var url = Uri.parse(API.userGetTrip + tripId.toString());
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
      print(jsonResponse['isReserved']);

      if (jsonResponse['isReserved'] == true) {
        print(
            "000000000000000000000000000000000000000000000000000000000000000");
        Get.find<GlobalStateController>().setTripIsReserved(true);
        print(
            "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        print(Get.find<GlobalStateController>().getTripIsReserved());
        print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      } else {
        Get.find<GlobalStateController>().setTripIsReserved(false);
        print("setted tooooooooooooooooooooooooooooooooooooo false");
        print(Get.find<GlobalStateController>().getTripIsReserved());
      }
      //Print the Token (Checking)
      // print(isReserved);

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

  //////////////////// show all trips ////////////////////////////
  ///
  Future<List<TripModel>?> getallTrips() async {
    try {
      print('in get');
      var url = Uri.parse(API.userShowAllTrips);
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
        List<TripModel> _model = TripListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

///////////////// Show Team Trips For User ///////////////////

  Future<List<TripModel>?> userGetTeamTrips(int? teamId) async {
    try {
      print('in get');
      var url = Uri.parse(API.teamTripsForUser + teamId.toString());
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('team trips');
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
