class ProductModel {
  final String id;
  final String name;
  final String price;
  final String userID;
  final String imgURL;
  bool isAddedToCard=false;
  static const String COLLECTION_NAME ='products';


  ProductModel({required this.id,required this.name,required this.price,
    required this.userID,required this.imgURL,required this.isAddedToCard});

  ProductModel.fromJson(dynamic json)
      : this(
    id: json['id']! as String,
    name: json['name']! as String,
    price: json['price']! as String,
    userID: json['userID']! as String,
    imgURL: json['imgURL']! as String,
      isAddedToCard: json['isAddedToCard']! as bool,
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'userID': userID,
      'imgURL': imgURL,
      'isAddedToCard': isAddedToCard,

    };
  }
}