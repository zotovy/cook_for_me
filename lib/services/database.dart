import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/util/contants.dart';

class DatabaseServices {
  static isUsernameUsed(String username) async {
    QuerySnapshot users =
        await userRef.where('username', isEqualTo: username).getDocuments();
    return users.documents.length == 1;
  }
}
