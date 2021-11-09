// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_user_app/custom-widgets/welcome_sliders.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: [
                  WelcomeSlider(
                    image: 'assets/images/slide_1.png',
                    title: 'Get Fresh Food',
                    subtitle: 'Get Fresh Food For Your Family',
                  ),
                  WelcomeSlider(
                    image: 'assets/images/slide_2.png',
                    title: 'Secure Payments',
                    subtitle: 'All your payments are securely processed',
                  ),
                  WelcomeSlider(
                    image: 'assets/images/slide_3.png',
                    title: 'Fast Delivery',
                    subtitle: 'Don\'t wait too much , we offer fast delivery',
                  ),
                ],
              ),
            )),
            Container(
              height: 80,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
