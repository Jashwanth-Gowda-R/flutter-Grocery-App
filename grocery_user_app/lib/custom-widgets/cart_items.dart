// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(itemBuilder: (bc, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    '',
                    height: 60,
                    width: 60,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text(''),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      RawMaterialButton(onPressed: () {}),
                      Text(''),
                      RawMaterialButton(onPressed: () {}),
                    ],
                  ),
                ),
                Container(
                  child: Text(''),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
