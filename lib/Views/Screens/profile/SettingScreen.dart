
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/profileController.dart';
import 'package:useditem/Logic/controller/settingsController.dart';
import 'package:useditem/localization/localizationService.dart';


class SettingScreen extends StatelessWidget {
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text('settings'.tr),
         ),
      body: GetBuilder<SettingsController>(builder: ((_){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('settings'.tr),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: controller.dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                isExpanded: true,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged:(String? str){
                  controller.changeDropDown(str);
                  LocalizationService().changeLocale(str!);
                },
                items: LocalizationService.langs.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      })),
    );
  }
}
