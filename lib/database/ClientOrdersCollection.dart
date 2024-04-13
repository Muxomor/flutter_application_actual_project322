import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrdersCollection {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String user = FirebaseAuth.instance.currentUser!.uid.toString();
  Future<void> addOrdersCollection(
    dynamic doc
  ) async {
    try {
      await _firebaseFirestore.collection('orders').add({
        'uid': user,
        'name': doc['name'],
        'image': doc['image'],
        'composition':doc['composition'],
        'price':doc['price'],
      });
    } catch (e) {
      return;
    }
  }

  Future<void> editOrdersCollection(
    dynamic doc,
    String userId,
    dynamic food,
  ) async {
    try {
      await _firebaseFirestore.collection('orders').doc(doc.id).update({
        'userId': userId,
        'food': food,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteOrdersCollection(dynamic doc) async {
    try {
      await _firebaseFirestore.collection('orders').doc(doc.id).delete();
    } catch (e) {
      return;
    }
  }
}