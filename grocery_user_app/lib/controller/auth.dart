import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:grocery_user_app/screens/login.dart';
import 'package:grocery_user_app/screens/tabs.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  var isloggin = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    validate();
  }

  validate() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        isloggin.value = true;
      } else {
        isloggin.value = false;
      }
    });
  }

  register(email, password, name, phoneNumber) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      var userid = res.user.uid;
      _db
          .collection('accounts')
          .doc(userid)
          .set({
            "name": name,
            "phoneNumber": phoneNumber,
            "email": email,
            "createdAt": FieldValue.serverTimestamp(),
            "imageURL": "http://placehold.it/120x120"
          })
          .then((value) => Get.offAll(const TabScreen()))
          .catchError((e) => {print(e)});
    }).catchError((e) {
      // print(e);
      Get.showSnackbar(GetBar(
        message: e.toString(),
        duration: const Duration(seconds: 5),
      ));
    });
  }

  login(email, password) {
    email = (email).trim().toLowerCase();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      // print(res);
      Get.offAll(TabScreen());
    }).catchError((e) {
      // print(e);
      Get.showSnackbar(GetBar(
        message: e.toString(),
        duration: Duration(seconds: 5),
      ));
    });
  }

  logout() {
    _auth
        .signOut()
        .then(
          (value) => Get.offAll(LoginScreen()),
        )
        .catchError((e) {
      Get.showSnackbar(GetBar(
        message: e.toString(),
        duration: Duration(seconds: 5),
      ));
    });
  }

  createAccountOnFireStore(userId, name, email, mobile, imgURL) {
    _db.collection("accounts").doc(userId).set({
      "name": name,
      "email": email,
      "createdAt": FieldValue.serverTimestamp(),
      "imageURL": imgURL,
      "phoneNumber": mobile,
    }).then((value) {
      Get.offAll(TabScreen());
    }).catchError((e) {
      print(e);
    });
  }

  signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    _auth.signInWithCredential(credential).then((res) {
      print(res);
      if (res.additionalUserInfo.isNewUser) {
        createAccountOnFireStore(
          res.user.uid,
          res.user.displayName,
          res.user.email,
          res.user.phoneNumber,
          res.user.photoURL,
        );
        isloggin.value = true;
        Get.offAll(TabScreen());
      } else {
        isloggin.value = true;
        Get.offAll(TabScreen());
      }
    }).catchError((e) {
      print(e);
    });
  }
}
