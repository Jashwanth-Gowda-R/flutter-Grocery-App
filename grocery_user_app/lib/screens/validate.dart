// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:grocery_user_app/screens/login.dart';
import 'package:grocery_user_app/screens/tabs.dart';
import 'package:grocery_user_app/screens/welcome.dart';

class Validate extends StatefulWidget {
  const Validate({Key key}) : super(key: key);

  @override
  _ValidateState createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggin = false;

  validate() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        setState(() {
          isloggin = true;
        });
      } else {
        setState(() {
          isloggin = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    validate();
  }

  @override
  Widget build(BuildContext context) {
    return isloggin ? TabScreen() : Welcome();
  }
}
