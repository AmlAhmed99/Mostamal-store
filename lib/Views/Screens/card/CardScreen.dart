
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/ProductController.dart';
import 'package:useditem/Models/ProductModel.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/cardWidget.dart';

class CardScreen extends StatefulWidget {

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final controller = Get.find<ProductController>();
  var value;
  @override
  void initState()  {
    // TODO: implement initState
    controller.loadCardItem();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Find Your",style: TextStyle(
                      fontSize: 23,
                      color: Colors.white
                  ),),
                  Text("Card Items",style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                  ),),
                  SizedBox(height:10,),
                ],
              ),
            ),
          ),

          SizedBox(height: 30,),

          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: controller.collection.doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                var output = snapshot.data!.data();
                var value = output?['cardItems']; // <-- Your value
                return   ConditionalBuilder(
                    condition:value!=null,
                    builder: (context){
                      return  Expanded(
                        child: ListView.builder(
                            itemCount:   value.length,
                            itemBuilder: (context,index){
                              return  CardWidget( value [index]);
                            }),
                      );
                    },
                    fallback:(context)=> Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/noItem.png'),
                        Text('Empty Card'),
                      ],
                    )
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          )

        ],
      ),
    );
  }
}
