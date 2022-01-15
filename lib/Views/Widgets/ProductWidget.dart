import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:useditem/Logic/controller/ProductController.dart';
import 'package:useditem/Styles/Colors.dart';

class ProductWidget extends StatelessWidget {
  DocumentSnapshot results;
  bool isadded = false;
  ProductWidget(this.results);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    isadded = results['isAddedToCard'];

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FirebaseAuth.instance.currentUser!.uid == results['userID']
                  ? GetBuilder<ProductController>(builder: ((_) {
                      return IconButton(
                          onPressed: () {
                            controller.deleteProduct(results['id']);
                          },
                          icon: Icon(Icons.delete));
                    }))
                  : IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
              GetBuilder<ProductController>(builder: ((_) {
                return IconButton(
                    onPressed: () {
                      controller.addToCard(
                          name: results['name'],
                          price: results['price'],
                          imgURL: results['imgURL']);
                      print(isadded);
                    },
                    icon: isadded
                        ? Icon(
                            Icons.add_shopping_cart,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ));
              }))
            ],
          ),
          GetBuilder<ProductController>(builder: (_) {
            return Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                // color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      results['imgURL'],
                    )),
              ),
            );
          }),

          //Image.asset(results['imgURL'],height: 150,),
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
                Text(
                  results['price'],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
