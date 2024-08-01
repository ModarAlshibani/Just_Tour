import 'package:terez/APIs.dart';
import 'package:terez/core/class/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postSignupData(
    String FirstName,
    String LastName,
    String Email,
    String Password,
    String Password_confirmation,
    String Number,
    String Age,
  ) async {
    var response = await crud.postData(API.signup, {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Password": Password,
      "Password_confirmation": Password_confirmation,
      "Number": Number,
      "Age": Age,
    });
    return response.fold((l) => l, (r) => r);
  }
}
