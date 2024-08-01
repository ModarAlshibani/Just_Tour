import 'package:terez/core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response =
        await crud.postData("http://127.0.0.1:8000/api/team/profile", {});
    return response.fold((l) => l, (r) => r);
  }
}
