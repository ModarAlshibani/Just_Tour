import 'package:get/get.dart';
import 'package:JustTour/core/class/statusRequest.dart';
import 'package:JustTour/core/functions/handlingData.dart';
import 'package:JustTour/data/dataSource/remote/testData.dart';

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
