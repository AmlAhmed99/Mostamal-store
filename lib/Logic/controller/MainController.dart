import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Views/Screens/card/CardScreen.dart';
import 'package:useditem/Views/Screens/product/ProductScreen.dart';
import 'package:useditem/Views/Screens/profile/ProfileScreen.dart';
import 'package:useditem/Views/Screens/rating/RateUsScreen.dart';

class MainController extends GetxController  {

  int selectedIndex = 0;
  var Screens = [
    ProductScreen(),
    CardScreen(),
    RateUsScreen(),
    ProfileScreen()
  ];

  void onSelectItem(int index) {
    selectedIndex = index;
    update();
  }



}