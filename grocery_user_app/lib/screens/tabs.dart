// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Account"),
        ],
      ),
    );
  }
}
