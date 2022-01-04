// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  final String title;
  final num value;

  DashBoardCard({
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 28, bottom: 28),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "$value",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
