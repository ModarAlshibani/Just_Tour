import 'package:get/get.dart';
import 'package:JustTour/core/class/crud.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
