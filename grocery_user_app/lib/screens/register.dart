// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/screens/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Account"),
      ),
      body: Container(
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
                  onPressed: () {},
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
    );
  }
}
