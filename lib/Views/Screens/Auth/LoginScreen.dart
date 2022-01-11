import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/my_string.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color.fromRGBO(129, 225, 209, 1.0),
        body: Column(

          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color:Color.fromRGBO(129, 225, 209, 1.0),
                ),

              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                //margin:  EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    //borderRadius:BorderRadius.circular(50)
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight:  Radius.circular(40))
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          child: Text("Login",style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),),
                          radius: 55,

                        ),

                        SizedBox(height: 15,),
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
                        SizedBox(height: 15,),
                        defaultFormField(
                          controller: passwordController,
                          label: "Password",
                          obscuretext: true,
                          type: TextInputType.text,
                          prefix: Icon(Icons.visibility_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty||value.toString().length<6) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),

                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: (){
                                Get.toNamed((Routes.ForgetPasswordRoute));
                              },
                                child: Text("Forget Password?",style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16
                                ),),),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        GetBuilder<AuthController>(builder: (_){
                          return  Container(
                            width: double.infinity,
                            child: CustomButton(
                              width:0,
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                              label: "Login",
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  controller.logInUsingFirebase(
                                  password: passwordController.text,
                                    email: emailController.text
                                  );

                                }
                              },
                            ),
                          );
                        }),
                        SizedBox(height: 15,),
                        Text("or create using",style: TextStyle(
                          color: AppColor.gray,
                          fontSize: 15
                        ),),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           CustomButton(
                             width:0,
                             backgroundColor: MaterialStateProperty.all(Colors.blue),
                             label: "Facebook",
                             onPressed: (){
                               if (_formKey.currentState!.validate()) {

                               }
                             },
                           ),
                          GetBuilder<AuthController>(builder: (_){
                            return  CustomButton(
                              width:0,
                              backgroundColor:MaterialStateProperty.all(Colors.red) ,
                              label: "Google",
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                               controller.googleSinUpApp();
                                }
                              },
                            );
                          }),
                         ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account",style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 15
                            ),),
                            TextButton(onPressed: (){
                             Get.offNamed((Routes.RegisterScreenRout));
                            },
                              child: Text("SignUp",style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16
                            ),),)
                          ],
                        )








                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

