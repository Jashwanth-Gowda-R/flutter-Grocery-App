// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, must_be_immutable, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/auth.dart';

import 'package:grocery_user_app/screens/register.dart';
import 'package:grocery_user_app/screens/tabs.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  AuthController _auth = AuthController();

  // GoogleSignIn _googleSignIn = GoogleSignIn();

  // login() {
  //   var email = (emailField.text).trim().toLowerCase();
  //   var password = passwordField.text;
  //   _auth
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((res) {
  //     // print(res);
  //     Get.offAll(TabScreen());
  //   }).catchError((e) {
  //     // print(e);
  //     Get.showSnackbar(GetBar(
  //       message: e.toString(),
  //       duration: Duration(seconds: 5),
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.green,
          ),
          title: Text(
            "Shani's Shop",
            style: TextStyle(
              color: Colors.green,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                  width: 120,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Shani's Shop",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailField,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Email Address",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: passwordField,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // login();
                      // Get.offAll(TabScreen());

                      _auth.login(emailField.text, passwordField.text);
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    child: Text('Create a New Account'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          _auth.signInWithFB();
                        },
                        child: Image.asset(
                          'assets/images/fb-icon.png',
                          height: 32,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          _auth.signInWithGoogle();
                        },
                        child: Image.asset(
                          'assets/images/google-icon.png',
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
