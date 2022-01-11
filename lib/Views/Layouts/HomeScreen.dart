import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/MainController.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<MainController>(builder: (_) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            controller.onSelectItem(index);
          },
          currentIndex: controller.selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Card'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), label: 'RateUs'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        body: controller.Screens[controller.selectedIndex],
      );
    }));
  }
}
