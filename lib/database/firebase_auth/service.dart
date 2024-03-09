import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_actual_project322/database/firebase_auth/model.dart';

class AuthService{
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

 Future<userModel?> signIn(String email,String password) async{
  try{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    User user = userCredential.user!;

    return userModel.fromFirebase(user);
  }
  catch(e){
    return null;
  }
 }

 Future<userModel?> signUp(String email,String password) async{
  try{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    User user = userCredential.user!;

    return userModel.fromFirebase(user);
  }catch(e){
    return null;
  }
 }

 Future<void> LogOut() async{
  return await _firebaseAuth.signOut();
 }

 Stream<userModel> get currentUser{
  return _firebaseAuth
  .authStateChanges()
  .map((User) => user!=null?userModel.fromFirebase(user):null);
 }

}