import 'package:useditem/Models/ProductModel.dart';

class UserModel {
   late dynamic id;
   late dynamic name;
   late dynamic email;
   dynamic address;
   dynamic phone;
   List<ProductModel>? cardItems;
  static const String COLLECTION_NAME ='users';


  UserModel({ this.id, this.name, this.email,this.phone,this.address,this.cardItems});

  UserModel.fromJson(dynamic json){
    id=json['id'] ;
    name= json['name'] ;
    address= json['address'] ;
    phone= json['phone'] ;
    email= json['email'] ;
      cardItems = [];
      json['cardItems']?.forEach((v) {
        cardItems!.add(ProductModel.fromJson(v));
      });

  }



  Map<String, Object?> toJson() {
    final map = <String, dynamic>{};
      map['id']=id;
    map['name']=name;
    map['email']=email;
    map['phone']=phone;
    map['address']=address;
    map['cardItems'] = cardItems?.map((v) => v.toJson()).toList();

   return map;
  }
}