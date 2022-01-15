import 'package:get/get.dart';

class SettingsController extends GetxController  {
  String dropdownValue = 'English';
  void changeDropDown(String? newValue){
    dropdownValue = newValue!;
    update();

  }

}