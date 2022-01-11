

import 'package:get/get.dart';
import 'package:useditem/Logic/controller/RateController.dart';

class RateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RateController());
  }
}