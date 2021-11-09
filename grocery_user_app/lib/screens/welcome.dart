// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                options: CarouselOptions(height: double.infinity),
                items: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/slide_1.png',
                          scale: 1,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Get Fresh Food',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Get Fresh Food For Your Family'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/slide_2.png',
                          scale: 1,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Fast Delivery',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Don\'t wait too much,we offer fast delivery'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/slide_3.png',
                          scale: 1,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Get Fresh Food',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Get Fresh Food For Your Family'),
                      ],
                    ),
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
                child: Text('Get Started'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
