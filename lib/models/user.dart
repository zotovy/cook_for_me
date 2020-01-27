import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String username;
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    this.id,
    this.username,
    this.name,
    this.email,
    this.profileImageUrl,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      username: doc['username'],
      name: doc['name'],
      email: doc['email'],
      profileImageUrl: doc['profileImageUrl'],
    );
  }
}
