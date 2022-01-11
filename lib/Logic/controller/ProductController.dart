import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Logic/controller/AuthController.dart';
import 'package:useditem/Models/ProductModel.dart' as MyProduct;
import 'package:useditem/Models/ProductModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:useditem/Models/UserModel.dart' as MyUser;

class ProductController extends GetxController  {

  MyProduct.ProductModel? myproduct;


  FirebaseAuth auth = FirebaseAuth.instance;

  void addProduct({
    required String name,
    required String price,
    required String imgURL
  }) async {
    CollectionReference<ProductModel> products = getProductCollectionWithConverter();
    DocumentReference<ProductModel> doc = products.doc();
    ProductModel product = ProductModel(
        id: doc.id,
        price: price,
        name: name,
        userID: FirebaseAuth.instance.currentUser!.uid ,
        imgURL: imgURL
    );

      doc.set(product).then((addedProduct) {
        update();
        print('success');
        Fluttertoast.showToast(msg: "product added successfully!", toastLength: Toast.LENGTH_LONG);
    }).onError((error, stackTrace) {
      print('on error');
      Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_LONG);
    });

  }

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) {

    picker.pickImage(source: source,)
        .then((value) {
      imageFile = value!;
      update();
    }).catchError((error) {
      print('errorrrrrrrrrr');
      print(error.toString());
    });

  }
   addToCard({
    required String name,
    required String price,
    required String imgURL
  }) async {
    CollectionReference<ProductModel> cards = getcardCollectionWithConverter();
    DocumentReference<ProductModel> doc = cards.doc();
    ProductModel card = ProductModel(
        id: doc.id,
        price: price,
        name: name,
        userID: FirebaseAuth.instance.currentUser!.uid ,
        imgURL: imgURL
    );

    doc.set(card).then((addedProduct) {
      update();
      print('success');
      Fluttertoast.showToast(msg: "product added to card successfully!", toastLength: Toast.LENGTH_LONG);
    }).onError((error, stackTrace) {
      print('on error');
      Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_LONG);
    });

  }

}