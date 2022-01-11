import 'package:flutter/material.dart';
import 'package:useditem/Styles/Colors.dart';

class Apptheme{
  static ThemeData lightTheme=ThemeData(
    primaryColor:AppColor.primaryColor,
    appBarTheme: AppBarTheme(
     color: AppColor.primaryColor
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.gray,
        elevation: 0
    ),
    textTheme: TextTheme(
      headline1: TextStyle(

      )
    )

  );

}