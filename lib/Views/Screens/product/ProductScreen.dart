import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/ProductController.dart';
import 'package:useditem/Routes/AppRoutes.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:useditem/Views/Widgets/ProductWidget.dart';

class ProductScreen extends StatelessWidget {

  final Stream<QuerySnapshot> prodtstream =
  FirebaseFirestore.instance.collection('products').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Stack(
           alignment: AlignmentDirectional.bottomEnd,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   width: double.infinity,
                   height: 200,
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
                         Text("Insperation",style: TextStyle(
                             fontSize: 30,
                             color: Colors.white
                         ),),
                         SizedBox(height:10,),
                         TextField(
                           decoration: InputDecoration(
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                                 borderSide: BorderSide(
                                   width: 0,
                                   style: BorderStyle.none,
                                 ),
                               ),
                               filled: true,
                               hintStyle: TextStyle(color: Colors.grey),
                               hintText: "Search With name",
                               fillColor: Colors.white,
                               prefixIcon: Icon(Icons.search),

                           ),
                         )
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text("Products",style: TextStyle(
                     fontSize: 20
                   ),),
                 ),
                 SizedBox(height: 20,),
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

                     return  Expanded(
                       child: GridView.builder(

                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             crossAxisSpacing: 10,
                             mainAxisSpacing: 10,
                             childAspectRatio: 0.65
                         ),
                         itemBuilder: (context,index){
                         DocumentSnapshot mytransaction = snapshot.data!.docs[index];
                         return snapshot.data!.docs.length==0
                             ?Center(child: Text("empty WatchList Items"))
                             : ProductWidget(mytransaction);
                       },
                         itemCount: snapshot.data!.docs.length,
                       ),
                     );
                   },
                 ),


               ],
             ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: FloatingActionButton(
                 backgroundColor: AppColor.primaryColor,
                  elevation: 15,
                 onPressed: (){
                   Get.toNamed(Routes.AddProductScreen);
                 },
                 child: Icon(Icons.add),
               ),
             )
           ],
         ),
      ),
    );
  }
}
