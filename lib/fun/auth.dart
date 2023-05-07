import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social/fun/storage.dart';
class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<String> SignUpUser({
    required String email,
    required String passward,
    required String username,
    required String bio,
    // required Uint8List file,


  }) async {
    String res = "some error";
    try {
      if (email.isNotEmpty || passward.isNotEmpty || username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: passward);
        print(cred.user!.uid);
        // String photourl= await    StorageMethod().uploadImageToStorage('profilepics',file, false);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'follower': [],
          'following': [],
          // 'photourl': photourl
        });
        // await _firestore.collection("users").add({
        //   'username': username,
        //   'uid':cred.user!.uid,
        //   'email': email,
        //   'bio':bio,
        //   'follower':[],
        //   'following':[]
        // });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> loginUser({
    required String username,
    required String email,
    required String passward

  }) async {
    String res = "some error";


    try {
      if(email.isNotEmpty||passward.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: passward);
       String res = "success";
      } else{
        res = "please enter all fields";
    }




    } catch (err) {
        return err.toString();
    }
    return res;
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
showSnakBar(String content,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:Text(content),
  ),);
}
