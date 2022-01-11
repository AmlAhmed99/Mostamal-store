import 'package:get/get.dart';
import 'package:useditem/Logic/controller/ProductController.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}