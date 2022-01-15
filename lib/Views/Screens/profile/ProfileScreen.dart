import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/profileController.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';
import 'package:useditem/Views/Widgets/bottomsheet.dart';

class ProfileScreen extends StatelessWidget {

  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [

                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: AppColor.primaryColor,

                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt,
                      size: 28,
                    ),
                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => BottomSheetWidget()),
                      );
                    },
                  ),
                )

              ],
            ),
            SizedBox(height: 15,),
            Text("Aml Ahmed",style: TextStyle(
                fontSize: 20
            ),),
            SizedBox(height: 70,),
            CustomButton(
              width:30,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              label: "Profile",
              onPressed: (){
                Get.toNamed(Routes.profileScreenRoute);
              },
              color:Colors.black,
              icon: Icons.person,
              type: MainAxisAlignment.start,
            ),
            SizedBox(height: 15,),
            CustomButton(
              width:30,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              label: "Messages",
              icon: Icons.message,
              onPressed: (){
               Get.toNamed(Routes.ChatsScreenRout);
              },
              color:Colors.black,
              type: MainAxisAlignment.start,
            ),
            SizedBox(height: 15,),
            CustomButton(
              width:30,
              backgroundColor: MaterialStateProperty.all(Colors.white),
              label: "Settings",
              icon: Icons.settings,
              onPressed: (){
                Get.toNamed(Routes.settingsScreenRoute);
              },
              color:Colors.black,
              type: MainAxisAlignment.start,
            ),
            SizedBox(height: 15,),
            GetBuilder<ProfileController>(builder: ((_){
              return  CustomButton(
                width:30,
                backgroundColor: MaterialStateProperty.all(Colors.white),
                label: "Logout",
                icon: Icons.logout,
                onPressed: (){
                  controller.signOut().then((value) => Get.offNamed(Routes.LoginScreenRout));
                },
                color:Colors.black,
                type: MainAxisAlignment.start,
              );
            })),




          ],
        ),
      ),
    );
  }
}
