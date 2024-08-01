import 'package:get/get.dart';

class GlobalStateController extends GetxController {
  var token = ''.obs; // Use.obs to make it observable

  void setToken(String? newToken) {
    token.value = newToken ?? '';
  }

  String? getToken() {
    return token.value;
  }
}
