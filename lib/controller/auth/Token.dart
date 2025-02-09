import 'package:get/get.dart';

class GlobalStateController extends GetxController {
  var token = ''.obs; // Use.obs to make it observable
  var tripIsReserved = false.obs;
  var teamIsFollowed = false.obs;

  void setToken(String? newToken) {
    token.value = newToken ?? '';
  }

  String? getToken() {
    return token.value;
  }

  void setTripIsReserved(bool? newTripIsReserved) {
    tripIsReserved.value = newTripIsReserved ?? false;
  }

  bool getTripIsReserved() {
    return tripIsReserved.value;
  }

   void TeamIsFollowed(bool? newTeamIsFollowed) {
    teamIsFollowed.value = newTeamIsFollowed ?? false;
  }

   bool getTeamIsFollowed() {
    return teamIsFollowed.value;
  }
}
