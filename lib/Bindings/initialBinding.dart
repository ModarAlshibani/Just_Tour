import 'package:get/get.dart';
import 'package:terez/core/class/crud.dart';

class initialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
