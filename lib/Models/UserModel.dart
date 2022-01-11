class UserModel {
  final String id;
  final String name;
  final String email;
  static const String COLLECTION_NAME ='users';


  UserModel({required this.id,required this.name,required this.email});

  UserModel.fromJson(Map<String, Object?> json)
      : this(
    id: json['id']! as String,
    name: json['name']! as String,
    email: json['email']! as String,
  );


  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}