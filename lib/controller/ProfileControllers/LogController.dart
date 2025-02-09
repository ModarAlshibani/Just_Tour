import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/data/model/trip_model.dart';

class LogController extends GetxController {
  Future<List<TripModel>?> getLog() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.log + "upComming");
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('Log');
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

  Future<List<TripModel>?> getLogIsFinished() async {
    try {
      print(
          '===========================================================in get');
      var url = Uri.parse(API.log + "IsFinished");
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${Get.find<GlobalStateController>().getToken()}'
        },
      );
      print(url);
      print('Log');
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
