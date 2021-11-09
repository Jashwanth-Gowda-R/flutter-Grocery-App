// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeSlider extends StatelessWidget {
  var image;
  var title;
  var subtitle;

  WelcomeSlider({this.image, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 1,
            height: 400,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text('$subtitle'),
        ],
      ),
    );
  }
}
