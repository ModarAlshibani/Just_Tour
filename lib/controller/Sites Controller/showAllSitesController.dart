import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/place_model.dart';

class ShowSitesController extends GetxController {
  Future<List<PlaceModel>?> getSites() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.showSitesUser);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('SItes List');
      print(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<PlaceModel> _model = SitesListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //============ Get Site Details =============//

  // Future<PlaceModel?> userGetSiteDetails(int siteId) async {

  //   var url = Uri.parse(API.userGetSite + siteId.toString());
  //   final response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization':
  //           'Bearer ${Get.find<GlobalStateController>().getToken()}'
  //     },
  //   );
  //   print(url);
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     // If the server returns a 200 OK response, parse the JSON.

  //     Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //    // bool isFollowed = jsonResponse['isFollowed'];

  //     print(jsonResponse['status']);
  //     print(jsonResponse['message']);
  //     print(jsonResponse['data']);
  //     print(jsonResponse['data']['Location']);
  //     Map<String, dynamic> siteData = jsonResponse['data'];
  //     PlaceModel site = PlaceModel.fromJson(siteData);
  //     return site;
  //   } else {
  //     print(response.statusCode);

  //     throw Exception('Failed to load site data');
  //   }

  // }

  //  /////////////////////////  For TEAM ////////////////////////////////////

  Future<List<PlaceModel>?> teamgetSites() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.showSitesTeam);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('SItes List');
      print(response.body);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<PlaceModel> _model = SitesListFromJson(response.body);
        print('Parsed model count: ${_model.length}');
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

/////////////////// Get Sites TEAM ////////////////////////

  Future<PlaceModel?> teamGetSiteDetails(int siteId) async {
    var url = Uri.parse(API.teamGetSite + siteId.toString());
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
      print(jsonResponse['data']['SiteName']);
      print(jsonResponse['data']['Location']);
      Map<String, dynamic> siteData = jsonResponse['data'];
      PlaceModel site = PlaceModel.fromJson(siteData);
      return site;
    } else {
      print(response.statusCode);

      throw Exception('Failed to load site data');
    }
  }
}
