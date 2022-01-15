
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Models/RateModel.dart';
import 'package:useditem/Styles/Colors.dart';

class RateController extends GetxController  {
  RateModel? myRate;

  void submitRating({
    required String price,
  }) async {
    CollectionReference<RateModel> products = getRateCollectionWithConverter();
    DocumentReference<RateModel> doc = products.doc();
    RateModel rate = RateModel(
        id: doc.id,
        price: price,
        userID: FirebaseAuth.instance.currentUser!.uid ,

    );

    doc.set(rate).then((addedProduct) {
      update();
      print('success');
      Get.snackbar(
        "Done",
        "product added successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:AppColor.primaryColor,
        colorText: Colors.white,
      );
    }).onError((error, stackTrace) {
      print('on error');
      Get.snackbar(
        "Error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:AppColor.primaryColor,
        colorText: Colors.white,
      );
    });

  }


}