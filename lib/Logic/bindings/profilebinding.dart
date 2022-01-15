import 'package:get/instance_manager.dart';
import 'package:useditem/Logic/controller/profileController.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}