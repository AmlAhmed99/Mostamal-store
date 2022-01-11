import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:useditem/Models/ProductModel.dart';
import 'package:useditem/Models/RateModel.dart';
import 'package:useditem/Models/UserModel.dart';

CollectionReference<UserModel> getUsersCollectionWithConverter(){
    return FirebaseFirestore.instance.collection(UserModel.COLLECTION_NAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }


CollectionReference<ProductModel> getProductCollectionWithConverter(){
  return FirebaseFirestore.instance.collection(ProductModel.COLLECTION_NAME)
      .withConverter<ProductModel>(
    fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );
}


CollectionReference<RateModel> getRateCollectionWithConverter(){
  return FirebaseFirestore.instance.collection(RateModel.COLLECTION_NAME)
      .withConverter<RateModel>(
    fromFirestore: (snapshot, _) => RateModel.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );
}

CollectionReference<ProductModel> getcardCollectionWithConverter(){
  return FirebaseFirestore.instance.collection("cards")
      .withConverter<ProductModel>(
    fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
    toFirestore: (user, _) => user.toJson(),
  );
}