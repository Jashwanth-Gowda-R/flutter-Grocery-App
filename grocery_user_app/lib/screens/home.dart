// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: [
                  Container(
                    child: Image.asset('assets/images/offers/1.png'),
                    padding: EdgeInsets.all(4),
                  ),
                  Container(
                    child: Image.asset('assets/images/offers/2.png'),
                    padding: EdgeInsets.all(4),
                  ),
                  Container(
                    child: Image.asset('assets/images/offers/3.png'),
                    padding: EdgeInsets.all(4),
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
