
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/ProductController.dart';
import 'package:useditem/Styles/Colors.dart';

class ProductWidget extends StatelessWidget {
  DocumentSnapshot results;

  ProductWidget(this.results,);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.chat)),
              GetBuilder<ProductController>(builder: ((_){
                return  IconButton(onPressed:
                    (){
                  controller.addToCard(
                      name: results['name'],
                      price: results['price'],
                      imgURL: results['imgURL']
                  );
                }, icon: Icon(Icons.add_shopping_cart));
              }))

            ],
          ),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(File(results['imgURL'])),
              fit: BoxFit.cover
            ),
          ),
        ),

          //Image.asset(results['imgURL'],height: 150,),
          Container(
            padding: EdgeInsets.only(left:10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(results['name'],maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(

                ),),
                Text(results['price'],style: TextStyle(
                    color: Colors.grey
                ),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
