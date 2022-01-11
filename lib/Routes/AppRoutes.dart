import 'package:get/get.dart';
import 'package:useditem/Logic/bindings/Authbinding.dart';
import 'package:useditem/Logic/bindings/Mainbinding.dart';
import 'package:useditem/Logic/bindings/productbinding.dart';
import 'package:useditem/Logic/bindings/rateBinding.dart';
import 'package:useditem/Views/Layouts/HomeScreen.dart';
import 'package:useditem/Views/Screens/product/AddProductScreen.dart';
import 'package:useditem/Views/Screens/Auth/ForgetPassword.dart';
import 'package:useditem/Views/Screens/Auth/ForgetPassword.dart';
import 'package:useditem/Views/Screens/Auth/LoginScreen.dart';
import 'package:useditem/Views/Screens/Auth/RegisterScreen.dart';
import 'package:useditem/Views/Screens/Auth/WelcomScreen.dart';
class AppRoutes{
  static const initialRoute=Routes.RegisterScreenRout;
  static final routes=[
  GetPage(name:Routes.HomeScreenRoute , page:()=> HomeScreen(),bindings: [
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
  ];

}

class Routes{
  static const  RegisterScreenRout="/RegisterScreenRoute";
  static const  LoginScreenRout="/LoginScreenRoute";
  static const HomeScreenRoute='/HomeScreenRoute';
  static const  ForgetPasswordRoute="/ForgetPasswordRoute";
  static const  WelcomScreenRoute="/WelcomScreenRoute";
  static const  AddProductScreen="/AddProductScreen";
}