// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/orders.dart';
import 'package:grocery_user_app/screens/orders_details.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  // List _orders = [
  //   {
  //     "id": "12345",
  //     "status": "Completed",
  //     "paymentMethod": "COD",
  //     "deliveryAddress": "34 Flutter Club, Earth 213512",
  //     "dateString": "21 May 2025",
  //     "cartTotal": 630.0,
  //     "itemsCount": 3,
  //     "cartItems": [
  //       {
  //         "imageURL": "assets/images/products/1.jpg",
  //         "title": "Carrot",
  //         "qty": 1,
  //         "price": 20.0,
  //         "total": 20.0,
  //       },
  //       {
  //         "imageURL": "assets/images/products/5.jpg",
  //         "title": "Raw Meat",
  //         "qty": 2,
  //         "price": 320.0,
  //         "total": 640.0,
  //       },
  //       {
  //         "imageURL": "assets/images/products/8.jpg",
  //         "title": "Orange",
  //         "qty": 1,
  //         "price": 170.0,
  //         "total": 170.0,
  //       }
  //     ]
  //   },
  //   {
  //     "id": "23412",
  //     "status": "Cancelled",
  //     "paymentMethod": "COD",
  //     "deliveryAddress": "34 Flutter Club, Earth 213512",
  //     "dateString": "25 Apr 2025",
  //     "cartTotal": 190.0,
  //     "itemsCount": 2,
  //     "cartItems": [
  //       {
  //         "imageURL": "assets/images/products/1.jpg",
  //         "title": "Carrot",
  //         "qty": 1,
  //         "price": 20.0,
  //         "total": 20.0,
  //       },
  //       {
  //         "imageURL": "assets/images/products/8.jpg",
  //         "title": "Orange",
  //         "qty": 1,
  //         "price": 170.0,
  //         "total": 170.0,
  //       }
  //     ]
  //   }
  // ];
  OrderController _orderCtrl = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: ListView.builder(
          itemCount: _orderCtrl.orders.length,
          itemBuilder: (bc, index) {
            return ListTile(
              onTap: () {
                Get.to(OrdersDetails(
                  orderDetailObj: _orderCtrl.orders[index],
                ));
              },
              title: Text('# ${_orderCtrl.orders[index]["id"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_orderCtrl.orders[index]["createdAt"]}'),
                  Text(
                      '${_orderCtrl.orders[index]["itemCount"]} items - ₹${_orderCtrl.orders[index]["cartTotal"]}')
                ],
              ),
              trailing: Text('${_orderCtrl.orders[index]["status"]}'),
              isThreeLine: true,
            );
          }),
    );
  }
}
