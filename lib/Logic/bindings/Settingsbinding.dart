import 'package:get/instance_manager.dart';
import 'package:useditem/Logic/controller/settingsController.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}