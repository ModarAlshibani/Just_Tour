import 'package:terez/APIs.dart';
import 'package:terez/core/class/crud.dart';

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
