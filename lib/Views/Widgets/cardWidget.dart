
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:useditem/Styles/Colors.dart';

class CardWidget extends StatelessWidget {
  DocumentSnapshot results;

  CardWidget(this.results,);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft:Radius.circular(10) ),
                image: DecorationImage(
                    image: FileImage(File(results['imgURL'])),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
               padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(results['name'],maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                   fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                  SizedBox(height: 20,),
                  Text(results['price'],style: TextStyle(
                      color: Colors.grey,
                    fontSize: 22
                  ),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.chat,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.white,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
