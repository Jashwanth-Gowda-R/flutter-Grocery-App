// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_user_app/controller/cart.dart';
import 'package:grocery_user_app/custom-widgets/cart_items.dart';

class CartPage extends StatelessWidget {
  CartController _cartCtrl = Get.put(CartController());

  // List _cartItems = [
  //   {
  //     "imageURL": "assets/images/products/1.jpg",
  //     "title": "Carrot",
  //     "qty": 1,
  //     "price": 20.0,
  //     "total": 20.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/5.jpg",
  //     "title": "Raw Meat",
  //     "qty": 2,
  //     "price": 320.0,
  //     "total": 640.0,
  //   },
  //   {
  //     "imageURL": "assets/images/products/8.jpg",
  //     "title": "Orange",
  //     "qty": 1,
  //     "price": 170.0,
  //     "total": 170.0,
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Container(
              child: _cartCtrl.getProductCount() == 0
                  ? Text('Cart is Empty')
                  : Text('Cart - ${_cartCtrl.getProductCount()} Items')),
        ),
      ),
      body: Obx(
        () => _cartCtrl.getProductCount() == 0
            ? Center(child: Text('No Items Cart in Cart'))
            : Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                            itemCount: _cartCtrl.cart.length,
                            itemBuilder: (bc, index) {
                              return CartItems(
                                id: _cartCtrl.cart[index]['id'],
                                imageURL: _cartCtrl.cart[index]['imageURL'],
                                title: _cartCtrl.cart[index]['title'],
                                qty: _cartCtrl.cart[index]['qty'],
                                price: _cartCtrl.cart[index]['price'],
                                total: _cartCtrl.cart[index]['total'],
                              );
                            }),
                      ),
                    ),
                    ListTile(
                      title: Text('Delivery Address'),
                      subtitle:
                          Text('#4,1st main road,kalyannagar,bengaluru-72'),
                      trailing: TextButton(
                          onPressed: () {},
                          child: Text('Change',
                              style: TextStyle(
                                color: Colors.green,
                              ))),
                    ),
                    ListTile(
                      title: Text('Payment Method'),
                      subtitle: Text('Cash On Delivery'),
                      trailing: TextButton(
                          onPressed: () {},
                          child: Text('Change',
                              style: TextStyle(
                                color: Colors.green,
                              ))),
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0),
                        onPressed: () {},
                        child: Obx(
                          () => Text(
                              'Checkout(₹${_cartCtrl.getTotalCartPrice()})',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      padding: EdgeInsets.all(4),
                      height: 60,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
