import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodsCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addFoodCollection(
    String id,
    Image image,
    String name,
    int price,
    int weight,
    String composition
  ) async {
    try{
      await _firebaseFirestore.collection('Foods').doc(id).set({
        'Composition':composition,
        'Image':image,
        'Name':name,
        'Price':price,
        'Weight':weight
      });
    }
    catch(e){
      return;
    }
  }

  Future<void> editFoodsCollection(String id,String name, int price,int weight,String composition)async{
    try{
      await _firebaseFirestore.collection('Foods').doc(id).update({
        'Composition':composition,
        'Name':name,
        'Price':price,
        'Weight':weight
      });
    }
    catch(e){
      return;
    }
  }

  Future<void> deleteFoodsCollection(String id) async
  {
    try{
      await _firebaseFirestore.collection('Foods').doc(id).delete();
    } catch(e){
      return;
    }
  }
}