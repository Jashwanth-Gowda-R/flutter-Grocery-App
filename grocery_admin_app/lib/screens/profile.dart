// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Edit Store"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 60,
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Name",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Email Address",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Mobile Number",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Address",
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.green,
                  ),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  logout();
                  // Get.offAll(LoginScreen());
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
