// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/cart.dart';

class CartItems extends StatelessWidget {
  String imageURL;
  var title;
  var qty;
  var price;
  var total;
  String id;

  CartItems(
      {this.id, this.imageURL, this.title, this.price, this.qty, this.total});

  CartController _cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 40,
              width: 40,
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Qty $qty x ₹$price'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      _cartCtrl.addtocart({
                        "id": id,
                        "title": title,
                        "price": price,
                        "qty": 1,
                        "imageURL": imageURL
                      });
                    },
                    fillColor: Colors.green,
                    elevation: 0,
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                    shape: CircleBorder(),
                    constraints: BoxConstraints(),
                  ),
                  Text('$qty'),
                  RawMaterialButton(
                    onPressed: () {
                      _cartCtrl.removefromcart({
                        "id": id,
                        "title": title,
                        "price": price,
                        "qty": 1,
                        "imageURL": imageURL
                      });
                    },
                    fillColor: Colors.green,
                    elevation: 0,
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 16,
                    ),
                    shape: CircleBorder(),
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text('₹$total'),
          ),
        ],
      ),
    );
  }
}
