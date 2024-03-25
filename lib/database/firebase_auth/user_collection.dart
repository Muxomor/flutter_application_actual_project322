import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addUserCollection(
    String id,
    String email,
    String name,
    String phone,
    String password,
  ) async {
    try {
      await _firebaseFirestore.collection('users').doc(id).set({
        'uid': id,
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> eidtUserCollection(String name, String image) async {
    final String user = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      await _firebaseFirestore.collection('users').doc(user).update({
        'name': name,
        'image': image,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteUserCollection(dynamic docs) async {
    try {
      await _firebaseFirestore.collection('users').doc(docs.id).delete();
    } catch (e) {
      return;
    }
  }
}
