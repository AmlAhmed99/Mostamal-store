import 'package:get/get.dart';
import 'package:useditem/Logic/bindings/Authbinding.dart';
import 'package:useditem/Logic/bindings/Mainbinding.dart';
import 'package:useditem/Logic/bindings/Settingsbinding.dart';
import 'package:useditem/Logic/bindings/productbinding.dart';
import 'package:useditem/Logic/bindings/profilebinding.dart';
import 'package:useditem/Logic/bindings/rateBinding.dart';
import 'package:useditem/Views/Layouts/HomeScreen.dart';
import 'package:useditem/Views/Screens/SearchScreen.dart';
import 'package:useditem/Views/Screens/product/AddProductScreen.dart';
import 'package:useditem/Views/Screens/Auth/ForgetPassword.dart';
import 'package:useditem/Views/Screens/Auth/ForgetPassword.dart';
import 'package:useditem/Views/Screens/Auth/LoginScreen.dart';
import 'package:useditem/Views/Screens/Auth/RegisterScreen.dart';
import 'package:useditem/Views/Screens/Auth/WelcomScreen.dart';
import 'package:useditem/Views/Screens/product/ProductDetails.dart';
import 'package:useditem/Views/Screens/profile/SettingScreen.dart';
import 'package:useditem/Views/Screens/profile/chats/ChatsScreen.dart';
import 'package:useditem/Views/Screens/profile/userProfileScreen.dart';
class AppRoutes{
  static const initialRoute=Routes.LoginScreenRout;
  static const secondaryRoute=Routes.HomeScreenRoute;
  static final routes=[
  GetPage(name:Routes.HomeScreenRoute , page:()=> HomeScreen(),bindings: [
    ProfileBinding(),
    RateBinding(),
    ProductBinding(),
    MainBinding(),
    AuthBinding()
  ] ),
  GetPage(name:Routes.RegisterScreenRout , page:()=> RegisterScreen(),binding:AuthBinding()),
  GetPage(name:Routes.LoginScreenRout , page:()=> LoginScreen(),binding:AuthBinding()),
  GetPage(name:Routes.ForgetPasswordRoute , page:()=> ForgetPassword(),binding:AuthBinding()),
  GetPage(name:Routes.WelcomScreenRoute , page:()=> WelcomScreen()),
  GetPage(name:Routes.AddProductScreen , page:()=> AddProductScreen(),binding: ProductBinding()),
    GetPage(name:Routes.profileScreenRoute , page:()=> UserprofileScreen(),binding:ProfileBinding()),
    GetPage(name:Routes.settingsScreenRoute , page:()=> SettingScreen(),binding: SettingBinding()),
    GetPage(name:Routes.SearchScreenRout , page:()=> SearchScreen()),
    GetPage(name:Routes.ChatsScreenRout , page:()=> ChatsScreen()),
    GetPage(name:Routes.ProductDetails , page:()=> ProductDetails()),
  ];

}

class Routes{
  static const  RegisterScreenRout="/RegisterScreenRoute";
  static const  LoginScreenRout="/LoginScreenRoute";
  static const HomeScreenRoute='/HomeScreenRoute';
  static const  ForgetPasswordRoute="/ForgetPasswordRoute";
  static const  WelcomScreenRoute="/WelcomScreenRoute";
  static const  AddProductScreen="/AddProductScreen";
  static const  profileScreenRoute="/profileScreen";
  static const  settingsScreenRoute="/settingsScreen";
  static const  SearchScreenRout="/SearchScreenRout";
  static const  ChatsScreenRout="/ChatsScreenRout";
  static const  ProductDetails="/ProductDetailsRout";

}