import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userID;
  final String name;
  final String email;

  User({
    this.userID,
    this.name,
    this.email,
  });

  Map<String, Object> toJson() {
    return {
      'userID': userID,
      'name': name,
      'email': email == null ? '' : email,
      'households': {},
    };
  }

  factory User.fromJson(Map<String, Object> doc) {
    User user = new User(
      userID: doc['userID'],
      name: doc['name'],
      email: doc['email'],
    );
    return user;
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}