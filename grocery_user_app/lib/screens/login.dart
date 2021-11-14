// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shani's Shop")),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            Text("Shani's Shop"),
            TextField(),
            TextField(),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text('Create a New Account'),
              ),
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
    );
  }
}
