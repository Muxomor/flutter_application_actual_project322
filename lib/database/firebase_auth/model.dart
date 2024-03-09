import 'package:firebase_auth/firebase_auth.dart';

class userModel{
  String? id;

  userModel.fromFirebase(User user){
    id = user.uid;
  }
}