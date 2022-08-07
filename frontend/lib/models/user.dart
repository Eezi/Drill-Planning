import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final String email;
  final String password;

  const User(
    this.id,
    this.email,
    this.password,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
  };
}
