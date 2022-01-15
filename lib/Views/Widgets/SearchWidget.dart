
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:useditem/Models/ProductModel.dart';
import 'package:useditem/Styles/Colors.dart';

class SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children:  [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.chat,
            label: 'Messege',
          ),
        ],
      ),

      child: Container(
        height: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(129, 225, 209, 0.29411764705882354),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft:Radius.circular(10) ),
                  image: DecorationImage(
                      image: NetworkImage(''),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('name',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                    SizedBox(height: 20,),
                    Text('price',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
