class RateModel{
  final String id;
  final String price;
  final String userID;
  static const String COLLECTION_NAME ='rates';
  RateModel({required this.price,required this.userID,required this.id});

  RateModel.fromJson(Map<String, Object?> json)
      : this(
    price: json['price']! as String,
    userID: json['userID']! as String,
    id: json['id']! as String,


  );
  Map<String, Object?> toJson() {
    return {
      'price': price,
      'userID': userID,
      'id': id,

    };
  }
}
