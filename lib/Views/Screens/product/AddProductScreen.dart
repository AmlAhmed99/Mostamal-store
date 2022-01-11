import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/ProductController.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/CustomEditText.dart';
import 'package:useditem/Views/Widgets/bottomsheet.dart';

class AddProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<ProductController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: Text("Add Your Item "),
        ),
        body: Stack(
          children: [
            Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(300))
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ConditionalBuilder(
                            condition: controller.imageFile != null,
                            builder: (context) =>
                                GetBuilder<ProductController>(builder: (_) {
                              return Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        FileImage(File(controller.imageFile!.path)),
                                  ),
                                ),
                              );
                            }),
                            fallback: (context) => Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/img4.jpg"),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                size: 28,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => BottomSheetWidget()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: nameController,
                        label: "Product Name",
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Product Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        controller: priceController,
                        label: "Product Price",
                        type: TextInputType.number,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Product Price';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GetBuilder<ProductController>(builder: (_) {
                        return Container(
                          width: double.infinity,
                          child: CustomButton(
                            width: 0,
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(129, 225, 209, 1.0)),
                            label: "Save",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.addProduct(
                                    price: priceController.text,
                                    name: nameController.text,
                                  imgURL: controller.imageFile!.path
                                );
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
          ],
        ),
      ),
    );
  }
}
