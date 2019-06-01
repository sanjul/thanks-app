
import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thanksapp/src/model/user.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<bool> setSignUpData();

  Future<bool> newUserFields(String email);

  Future<bool> isFireLogexists(String email);

  Future<bool> updateUserFields(String email, userFields fields);
   
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        print(user);
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  Future<bool> newUserFields(String email) async {
    try {
      if ( await this.isFireLogexists(email) ) {
        await Firestore.instance.collection("users").document().setData({
          "email": "hemmymouli@gmail.com"
        }); 

        return true;
      }

      return true;
      
    } catch(e){
      return false;
    }
  }

  Future<bool> updateUserFields(String email, userFields fields) async {
    try {
      if ( await this.isFireLogexists(email) ) {
        
        await Firestore.instance.collection("users").document().setData(fields.getJson()); 

        return true;
      }

      return true;
      
    } catch(e){
      return false;
    }
  }

  Future<bool> isFireLogexists( String email ) async {
    if ( await Firestore.instance.collection("users").where("email", isEqualTo: email ).snapshots().length != null ) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setSignUpData() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    
  }

}

class Sting {
}