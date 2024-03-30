import 'package:cloud_firestore/cloud_firestore.dart';


class FoodsCollection{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> addFoodCollection(
    String image,
    String name,
    int price,
    int weight,
    String composition
  ) async {
    try{
      await _firebaseFirestore.collection('foods').add({
        'composition':composition,
        'image':image,
        'name':name,
        'price':price,
        'weight':weight
      });
    }
    catch(e){
      return;
    }
  }

  Future<void> editFoodsCollection(dynamic docs,String name, int price,int weight,String composition)async{
    
    try{
      await _firebaseFirestore.collection('foods').doc(docs.id).update({
        'composition':composition,
        'name':name,
        'price':price,
        'weight':weight
      });
    }
    catch(e){
      return;
    }
  }

  Future<void> deleteFoodsCollection(dynamic docs,) async
  {
    try{
      await _firebaseFirestore.collection('foods').doc(docs.id).delete();
    } catch(e){
      return;
    }
  }
}