
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Models/RateModel.dart';

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
      Fluttertoast.showToast(msg: "your rate added successfully! thank you!", toastLength: Toast.LENGTH_LONG);
    }).onError((error, stackTrace) {
      print('on error');
      Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_LONG);
    });

  }


}