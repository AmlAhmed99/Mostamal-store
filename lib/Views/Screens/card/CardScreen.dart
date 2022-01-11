
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/cardWidget.dart';

class CardScreen extends StatelessWidget {
  final Stream<QuerySnapshot> prodtstream =
  FirebaseFirestore.instance.collection('cards').snapshots();
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
          StreamBuilder<QuerySnapshot>(
            stream: prodtstream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return   Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot mytransaction = snapshot.data!.docs[index];
                      return snapshot.data!.docs.length==0
                          ?Center(child: Text("empty Card "))
                          : CardWidget(mytransaction);
                    }),
              );
            },
          ),


        ],
      ),
    );
  }
}
