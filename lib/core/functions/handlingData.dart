import 'package:JustTour/core/class/statusRequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    print("object");
    return response;
  } else {
    print("Success");
    return StatusRequest.success;
  }
}
