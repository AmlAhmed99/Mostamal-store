import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/bindings/Authbinding.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Apptheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:useditem/localization/localizationService.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: Apptheme.lightTheme,
      locale:Get.deviceLocale,
      fallbackLocale: LocalizationService.locale,
      initialRoute:
      //AuthController.checkLoggedInUser()?AppRoutes.initialRoute:
      AppRoutes.initialRoute,
      initialBinding: AuthBinding(),
    );
  }
}


