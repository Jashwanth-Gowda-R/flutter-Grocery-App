// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/cart.dart';

class ProductCard extends StatelessWidget {
  CartController _cartCtrl = Get.put(CartController());

  String imageURL;
  var title;
  var price;
  String id;

  ProductCard({this.id, this.imageURL, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                // 'assets/images/products/1.jpg',
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹$price',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          _cartCtrl.addtocart({
                            "id": id,
                            "price": price,
                            "title": title,
                            "qty": 1,
                            "imageURL": imageURL
                          });
                        },
                        child: Icon(
                          Icons.add,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
