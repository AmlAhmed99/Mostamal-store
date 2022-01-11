import 'package:get/instance_manager.dart';
import 'package:useditem/Logic/controller/AuthController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}