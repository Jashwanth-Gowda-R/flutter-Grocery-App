// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoriesBadge extends StatelessWidget {
  var title;

  CategoriesBadge({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
        bottom: 2,
        left: 20,
        right: 20,
      ),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Text(
        '$title',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
