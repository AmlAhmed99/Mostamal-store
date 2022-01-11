import 'package:get/instance_manager.dart';
import 'package:useditem/Logic/controller/MainController.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}