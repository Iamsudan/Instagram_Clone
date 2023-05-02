import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  


  //sign up user
 Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String fullName,
    // required Uint8List file,

  }) 
  async{
    String res = "Some error occured";
    try{
      if(email.isNotEmpty||password.isNotEmpty||fullName.isNotEmpty)
      {
        //register app
       UserCredential cred=  await _auth.createUserWithEmailAndPassword(email: email, password: password);
       
       print(cred.user!.uid);
       //add user to our database
       
       _firestore.collection('users').doc(cred.user!.uid).set({
        'username': username,
        'uid': cred.user!.uid,
        'email': email,
        'full name': fullName,
        'followers': [] ,
        'following': [],

       });

        // await _firestore.collection('users').add({
        //   'username': username,
        // 'uid': cred.user!.uid,
        // 'email': email,
        // 'full name': fullName,
        // 'followers': [] ,
        // 'following': [],

        // });


       res = "success";
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;

    }
}