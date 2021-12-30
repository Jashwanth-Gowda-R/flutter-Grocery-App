// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/screens/categories.dart';
import 'package:grocery_admin_app/screens/manage-product.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(ManageProductScreen(canEdit: false, product: {}));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextButton(
                  onPressed: () {
                    Get.to(CategoriesScreen());
                  },
                  child: Text("Manage Categories")),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (bc, index) {
                  return ListTile(
                    title: Text("${_products[index]["title"]}"),
                    subtitle: Text("${_products[index]["price"]}"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                      ),
                      onPressed: () {
                        Get.to(ManageProductScreen(
                          canEdit: true,
                          product: _products[index],
                        ));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
