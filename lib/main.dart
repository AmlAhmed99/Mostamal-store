import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Apptheme.dart';
import 'package:useditem/Views/Layouts/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      theme: Apptheme.lightTheme,
      initialRoute:AppRoutes.initialRoute,
    );
  }
}


