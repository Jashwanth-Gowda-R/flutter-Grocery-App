import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_admin_app/screens/login.dart';
import 'package:grocery_admin_app/screens/tabs.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var isloggin = false.obs;

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

  login(email, password) {
    email = (email).trim().toLowerCase();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      // print(res);
      Get.offAll(TabsScreen());
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

}
