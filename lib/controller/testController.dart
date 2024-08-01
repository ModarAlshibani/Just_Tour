import 'package:get/get.dart';
import 'package:terez/core/class/statusRequest.dart';
import 'package:terez/core/functions/handlingData.dart';
import 'package:terez/data/dataSource/remote/testData.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    getData();
  }
}
