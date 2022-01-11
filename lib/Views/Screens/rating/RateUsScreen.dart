
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useditem/Logic/controller/RateController.dart';
import 'package:useditem/Styles/Colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:useditem/Views/Widgets/CustomButton.dart';

class RateUsScreen extends StatelessWidget {
  final controller = Get.find<RateController>();
  var price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/rateus.png",fit: BoxFit.cover,),
            Text("Your opinion matters to us!",style: TextStyle(
                fontSize: 20
            ),),

            Container(
              width: 300,
              child: Text("We work suber hard to serve you best work and would love to konw"
                  "how would you rate our app?",style: TextStyle(
                  fontSize: 15,
                color: AppColor.gray,),
                maxLines: 3,
              ),
            ),

        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            price=rating.toString();
          },
        ),
            GetBuilder<RateController>(builder: (_){
              return CustomButton(
                width:0,
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(129, 225, 209, 1.0)),
                label: "Submit",
                onPressed: (){
                  controller.submitRating(
                    price: price
                  );
                },
              );
            })

          ],
        ),
      ),
    );
  }
}
