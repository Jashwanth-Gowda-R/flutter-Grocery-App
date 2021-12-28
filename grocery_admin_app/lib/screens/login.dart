// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/screens/tabs.dart';

class LoginScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  login() {
    var email = (emailField.text).trim().toLowerCase();
    var password = passwordField.text;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 120,
                width: 120,
              ),
              SizedBox(height: 16),
              Text(
                "Shani's shop",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    login();
                    // Get.offAll(TabsScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
