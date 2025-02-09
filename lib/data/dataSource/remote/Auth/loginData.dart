import 'package:JustTour/APIs.dart';
import 'package:JustTour/core/class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postLoginData(
    String Email,
    String Password,
  ) async {
    var response = await crud.postData(API.login, {
      "Email": Email,
      "Password": Password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
