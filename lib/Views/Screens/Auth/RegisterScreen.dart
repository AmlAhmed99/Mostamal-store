import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/my_string.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController AddreesController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
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
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(

                      children: [
                        CircleAvatar(child:
                          Text("Register",style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                          ),),
                        radius: 55,
                          backgroundColor: AppColor.primaryColor,
                        ),
                        SizedBox(height: 15,),
                        defaultFormField(
                          controller: nameController,
                          label: "Username",
                          type: TextInputType.text,
                          prefix: Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty||!RegExp(validationName).hasMatch(value)) {
                            return 'Please enter correct name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        defaultFormField(
                          controller: emailController,
                          label: "Email",
                          type: TextInputType.emailAddress,
                          prefix: Icon(Icons.email),
                          validator: (value) {
                            if (value == null || value.isEmpty ||!RegExp(validationEmail).hasMatch(value)) {
                              return 'Please enter correct email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        // defaultFormField(
                        //   controller: phoneController,
                        //   label: "Phone",
                        //   type: TextInputType.phone,
                        //   prefix: Icon(Icons.phone),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your phone';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        // SizedBox(height: 15,),
                        // defaultFormField(
                        //   controller: AddreesController,
                        //   label: "Address",
                        //   type: TextInputType.text,
                        //   prefix: Icon(Icons.map),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter your address';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        // SizedBox(height: 15,),
                        defaultFormField(
                          controller: passwordController,
                          label: "Password",
                          type: TextInputType.text,
                          obscuretext: true,
                          prefix: Icon(Icons.visibility_rounded),
                          validator: (value) {
                            if (value == null || value.isEmpty||value.toString().length<6) {
                              return 'Please enter correct password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        GetBuilder<AuthController>(builder: (_){
                          return CustomButton(
                            width:0,
                            backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                            label: "Create Account",
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                controller.signUpUsingFirebase(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text

                                );
                              }
                            },
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
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account",style: TextStyle(
                                color: AppColor.gray,
                                fontSize: 15
                            ),),
                            TextButton(onPressed: (){
                             Get.offNamed((Routes.LoginScreenRout));
                            },
                              child: Text("Login",style: TextStyle(
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
