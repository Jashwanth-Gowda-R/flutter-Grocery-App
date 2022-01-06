// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/auth.dart';
import 'package:grocery_user_app/screens/login.dart';
import 'package:grocery_user_app/screens/tabs.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key key}) : super(key: key);

  TextEditingController namefield = TextEditingController();
  TextEditingController emailfield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  TextEditingController mobilenumberfield = TextEditingController();

  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseFirestore _db = FirebaseFirestore.instance;

  // register() {
  //   var email = (emailfield.text).trim().toLowerCase();
  //   var password = passwordfield.text;
  //   _auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((res) {
  //     var userid = res.user.uid;
  //     _db
  //         .collection('accounts')
  //         .doc(userid)
  //         .set({
  //           "name": namefield.text,
  //           "phoneNumber": mobilenumberfield.text,
  //           "email": emailfield.text,
  //           "createdAt": FieldValue.serverTimestamp(),
  //           "imageURL": "http://placehold.it/120x120"
  //         })
  //         .then((value) => Get.offAll(TabScreen()))
  //         .catchError((e) => {print(e)});
  //   }).catchError((e) {
  //     // print(e);
  //     Get.showSnackbar(GetBar(
  //       message: e.toString(),
  //       duration: Duration(seconds: 5),
  //     ));
  //   });
  // }

  AuthController _auth = AuthController();

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
          "Create New Account",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
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
                  controller: namefield,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Full Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: mobilenumberfield,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Phone Number",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: emailfield,
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
                  controller: passwordfield,
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
                      _auth.register(emailfield.text, passwordfield.text,
                          namefield.text, mobilenumberfield.text);
                    },
                    child: Text('Register'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text('Already Have An Account..?'),
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
                        onPressed: () {},
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
                        onPressed: () {},
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
