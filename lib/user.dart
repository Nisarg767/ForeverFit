import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String firname;
  final String email;
  final String laname;
  final String mobile;

  User({
    this.id,
    this.firname,
    this.email,
    this.laname,
    this.mobile,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['uid'],
      email: doc['email'],
      firname: doc['displayName'],
      laname: doc['lname'],
      mobile: doc['mobile'],
    );
  }
}