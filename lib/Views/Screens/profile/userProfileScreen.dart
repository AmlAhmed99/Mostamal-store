
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/my_string.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Logic/controller/profileController.dart';
import 'package:useditem/Models/UserModel.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';
import 'package:useditem/Views/Widgets/bottomsheet.dart';

class UserprofileScreen extends StatefulWidget {

  @override
  State<UserprofileScreen> createState() => _UserprofileScreenState();
}

class _UserprofileScreenState extends State<UserprofileScreen> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<ProfileController>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController PhoneController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController AddreesController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        emailController.text=doc['email'];
        nameController.text= doc['name'];
        PhoneController.text=doc['phone'];
        AddreesController.text= doc['address'];
        print(doc['email']);
      });
    });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 100),
        child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
                  if (value == null || value.isEmpty||!RegExp(validationEmail).hasMatch(value) ) {
                    return 'Please enter correct email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              defaultFormField(
                controller: PhoneController,
                label: "Phone",
                type: TextInputType.number,
                prefix: Icon(Icons.phone),
                validator: (value) {
                  if (value == null || value.isEmpty||value.toString().length<11) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              defaultFormField(
                controller: AddreesController,
                label: "Address",
                type: TextInputType.text,
                prefix: Icon(Icons.map),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              GetBuilder<AuthController>(builder: (_){
                return  Container(
                  width: double.infinity,
                  child: CustomButton(
                    width:0,
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                    label: "Update",
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        controller.updateProfile
                          (name: nameController.text,
                            email: emailController.text,
                            phone: PhoneController.text,
                            address: AddreesController.text);

                      }
                    },
                  ),
                );
              }),
              SizedBox(height: 15,),
              GetBuilder<AuthController>(builder: (_){
                return  Container(
                  width: double.infinity,
                  child: CustomButton(
                    width:0,
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                    label: "Get my current location",
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        controller.getUserLocation();
                        AddreesController.text=controller.address!;

                      }
                    },
                  ),
                );
              }),








            ],
          ),
        ),
    ),
      ),
    );
  }
}

