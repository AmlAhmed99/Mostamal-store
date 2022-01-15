
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:useditem/Logic/controller/ProductController.dart';

class BottomSheetWidget extends StatelessWidget {
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      //width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children:[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
            Column(
              children: [
                GetBuilder<ProductController>(builder: (_){
                  return IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      controller.takePhoto(ImageSource.camera);

                    },

                  );
                }
                ),
                Text("Camera")
              ],
            ),
            Column(
              children: [
            GetBuilder<ProductController>(builder: (_){
              return IconButton(
                icon: Icon(Icons.image),
                onPressed: () {
                  controller.takePhoto(ImageSource.gallery);
                },

              );
                }
            ),

                Text("Gallary")
              ],
            ),
          ]
          ),
        ],
      ),
    );
  }

}
