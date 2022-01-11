
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';

class WelcomScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(300),
            )
          ),
          child: Column(
            
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("GO",style: TextStyle(
                    color:AppColor.primaryColor,
                    fontSize: 70
                ),),
                radius: 70,
              ),
              SizedBox(
                height: 130,
              ),
          Container(
            width: double.infinity,
            child: CustomButton(
              width:0,
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
              label: "Login",
              onPressed: (){
                Get.offNamed((Routes.LoginScreenRout));
              },
            ),
          ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  onPressed: (){
                    Get.offNamed((Routes.RegisterScreenRout));
                  },
                  child: Text('Signup', style: TextStyle(
                      color: Colors.white,
                  )
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid
                  ), borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
