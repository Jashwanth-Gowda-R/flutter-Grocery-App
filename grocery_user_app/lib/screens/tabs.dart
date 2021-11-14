// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_user_app/screens/account.dart';
import 'package:grocery_user_app/screens/cart.dart';
import 'package:grocery_user_app/screens/home.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _currentIndex = 0;
  var _screenList = [
    HomePage(),
    CartPage(),
    AccountPage(),
  ];

  changeIndex(selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changeIndex,
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
