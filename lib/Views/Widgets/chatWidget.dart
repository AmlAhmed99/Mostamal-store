
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:useditem/Styles/Colors.dart';

class Chatwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.primaryColor,
            radius: 30,

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('name name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text('21/01/2020',style: TextStyle(fontSize: 17,color: Colors.grey),),
                      ],
                    ),
                    width: double.infinity,
                  ),
                  Text('name name',style: TextStyle(fontSize: 17,color: Colors.grey),),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
