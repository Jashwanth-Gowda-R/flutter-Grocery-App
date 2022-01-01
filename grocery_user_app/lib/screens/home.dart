// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/custom-widgets/categories_badge.dart';
import 'package:grocery_user_app/custom-widgets/product_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List _products = [
  //   {
  //     "imageURL": "assets/images/products/1.jpg",
  //     "title": "Carrot",
  //     "price": 40.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/2.jpg",
  //     "title": "Gourd",
  //     "price": 30.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/3.jpg",
  //     "title": "Meat",
  //     "price": 400.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/4.jpg",
  //     "title": "Lettuce",
  //     "price": 60.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/5.jpg",
  //     "title": "Meat Big Piece",
  //     "price": 320.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/6.jpg",
  //     "title": "Pomegranate",
  //     "price": 180.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/7.jpg",
  //     "title": "Strawberry",
  //     "price": 540.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/8.jpg",
  //     "title": "Orange",
  //     "price": 170.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/9.jpg",
  //     "title": "spinach",
  //     "price": 70.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/10.jpg",
  //     "title": "Cabbage",
  //     "price": 26.0,
  //   },
  // ];

  FirebaseFirestore _db = FirebaseFirestore.instance;

  var _products = [];

  fetchProducts() {
    _db.collection('products').snapshots().listen((value) {
      var temp = [];
      value.docs.forEach((product) {
        temp.add({"id": product.id, ...product.data()});
      });
      setState(() {
        _products = temp;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
    fetchCategories();
  }

  // List _categories = [
  //   "All",
  //   "Vegetables",
  //   "Meat",
  //   "Fruits",
  //   "Snacks",
  //   "Drinks",
  //   "Oils",
  //   "Daily Needs"
  // ];

  var _categories = [];

  fetchCategories() {
    _db.collection('categories').snapshots().listen((value) {
      var temp = [];
      value.docs.forEach((element) {
        temp.add({
          "id": element.id,
          "title": element.data()['title'],
        });
      });
      setState(() {
        _categories = temp;
      });
    });
  }

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
            Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (bc, index) {
                    return CategoriesBadge(
                      title: _categories[index]['title'],
                    );
                  }),
            ),
            Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (bc, index) {
                    return ProductCard(
                      id: _products[index]["id"],
                      imageURL: _products[index]["imgURL"],
                      title: _products[index]['title'],
                      price: _products[index]['price'],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
