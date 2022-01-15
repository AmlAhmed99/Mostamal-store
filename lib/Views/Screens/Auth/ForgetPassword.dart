import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/my_string.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';

class ForgetPassword extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              width: 400,
              child: Text("if you want to recover your account then please provide your email id below",style: TextStyle(
                fontSize: 15,
                color:Colors.black,),
                maxLines: 2,
              ),
            ),
            Image.asset("assets/images/forgetpassword.jpg"),
            defaultFormField(
              controller: emailController,
              label: "Email",
              type: TextInputType.emailAddress,
              prefix: Icon(Icons.email),
              validator: (value) {
                if (value == null || value.isEmpty||!RegExp(validationEmail).hasMatch(value) ) {
                  return 'Please enter correct email';
                }
                return null;
              },
            ),
            SizedBox(height: 50,),
            GetBuilder<AuthController>(builder: (_){
              return  CustomButton(
                width: 0,
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                label: "Submit",
                onPressed: (){
                   controller.resetPassword(
                     email: emailController.text
                   );
                },
              );
            }),


          ],
        ),
      ),
    );
  }
}
