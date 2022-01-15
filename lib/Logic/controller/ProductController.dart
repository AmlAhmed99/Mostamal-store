import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:useditem/FirebaseUtiles/FirebaseUtiles.dart';
import 'package:useditem/Models/ProductModel.dart' as MyProduct;
import 'package:useditem/Models/ProductModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as p;
import 'package:useditem/Models/UserModel.dart';
import 'package:useditem/Styles/Colors.dart';


class ProductController extends GetxController  {

  MyProduct.ProductModel? myproduct;


  FirebaseAuth auth = FirebaseAuth.instance;

  void addProduct({
    required String name,
    required String price,

  }) async {
    CollectionReference<ProductModel> products = getProductCollectionWithConverter();
    DocumentReference<ProductModel> doc = products.doc();
    ProductModel product = ProductModel(
        id: doc.id,
        price: price,
        name: name,
        userID: FirebaseAuth.instance.currentUser!.uid ,
        imgURL: myURL,
      isAddedToCard: false
    );

      doc.set(product).then((addedProduct) {
        update();
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
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });

  }

  XFile? imageFile ;
  final ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) {
    update();
    picker.pickImage(source: source,)
        .then((value) {
      imageFile = value!;
      uploadImage();
      update();
    }).catchError((error) {
      print('errorrrrrrrrrr');
      print(error.toString());
    });
    update();
  }
  String myURL='';

  void uploadImage() async{
    try {
      update();
      File myfile = File(imageFile!.path);
      FirebaseStorage.instanceFor(
          bucket: 'gs://useditem-1970e.appspot.com');
      String file=p.basename(imageFile!.path);
      await FirebaseStorage.instance
          .ref("/files$file")
          .putFile(myfile );

      String downloadURL = await FirebaseStorage.instance
          .ref("/files$file")
          .getDownloadURL();

      myURL = downloadURL;
      print(myURL);
      update();
    } catch (ex) {
     print('errrrrror in storageeeeeeeeeeeeeeeeeeeeeeeeeee'+ex.toString());

    }
  }

  //  addToCard({
  //   required String name,
  //   required String price,
  //   required String imgURL
  // }) async {
  //   CollectionReference<ProductModel> cards = getcardCollectionWithConverter();
  //   DocumentReference<ProductModel> doc = cards.doc();
  //
  //   ProductModel card = ProductModel(
  //       id: doc.id,
  //       price: price,
  //       name: name,
  //       userID: FirebaseAuth.instance.currentUser!.uid ,
  //       imgURL: imgURL
  //   );
  //
  //   doc.set(card).then((addedProduct) {
  //     update();
  //     Get.snackbar(
  //       "Done",
  //       "product added to card successfully!",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: AppColor.primaryColor,
  //       colorText: Colors.white,
  //     );
  //
  //   }).onError((error, stackTrace) {
  //     print('on error');
  //     Get.snackbar(
  //       "Error",
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   });
  //
  // }

  dynamic carditems=[];
  void addToCard(
      {
        required String name,
        required String price,
        required String imgURL,
      }
      ){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference<UserModel> cards = getUsersCollectionWithConverter();
    DocumentReference<UserModel> doc = cards.doc();

    ProductModel card = ProductModel(
        id: doc.id,
        price: price,
        name: name,
        userID: FirebaseAuth.instance.currentUser!.uid ,
        imgURL: imgURL,
        isAddedToCard: true
    );

      carditems.add(card.toJson());

    users.doc(auth.currentUser!.uid)
        .update({
      'cardItems':carditems
    }).then((value){
      update();
      print(carditems);
      print(card.name);

      Get.snackbar(
        "Done",
        "product added to card successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      );

    }).catchError((error) => print("Failed to update user: $error"));
    update();
  }
  var collection = FirebaseFirestore.instance.collection('users');
  void loadCardItem()async{
    var docSnapshot = await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['cardItems']; // <-- The value you want to retrieve.
      // Call setState if needed.
      print(value);
    }
  }

    CollectionReference product = FirebaseFirestore.instance.collection('products');

    Future<void> deleteProduct(String id) {
      return product
          .doc(id)
          .delete()
          .then((value) =>  Get.snackbar(
        "Done",
        "product deleted successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.primaryColor,
        colorText: Colors.white,
      ))
          .catchError((error) => print("Failed to delete user: $error"));
    }


  }
























