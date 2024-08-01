import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid Email".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone number".tr;
    }
    if (val.isEmpty) {
      return "can't be empty".tr;
    }
  }
  if (val.length < min) {
    return "can't be less than 8 characters".tr;
  }
  if (val.length > max) {
    return "it's too long".tr;
  }
}
