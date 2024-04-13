import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addUserCollection(
    String id,
    String image,
    String email,
    String name,
    String phone,
    String password,
  ) async {
    try {
      await _firebaseFirestore.collection('users').doc(id).set({
        'uid': id,
        'email': email,
        'image':image,
        'name': name,
        'phone': phone,
        'password': password,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> eidtUserCollection(dynamic doc,String name, String image) async {
    final String user = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      await _firebaseFirestore.collection('users').doc(doc.id).update({
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
