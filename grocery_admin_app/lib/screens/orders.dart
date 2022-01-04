// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/controllers/orders.dart';
import 'package:grocery_admin_app/screens/order-detail.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrderController _orderCtrl = Get.put(OrderController());
  // List _orderList = [
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

  toDateString(timestamp) {
    var date = DateTime.parse(timestamp.toDate().toString());
    var formatter = DateFormat("dd-MMM-yyyy hh:mm a");
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Orders"),
        actions: [
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () async {
              var picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now());
              if (picked != null) {
                print(picked);
                _orderCtrl.fetchOrders(picked.toString());
              }
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _orderCtrl.orders.length,
          itemBuilder: (bc, index) {
            return ListTile(
              title: Text("# ${_orderCtrl.orders[index]["id"]}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${toDateString(_orderCtrl.orders[index]["createdAt"])}"),
                  Text(
                      "${_orderCtrl.orders[index]["itemCount"]} Items - ₹ ${_orderCtrl.orders[index]["cartTotal"]}"),
                ],
              ),
              isThreeLine: true,
              trailing: Text("${_orderCtrl.orders[index]["status"]}"),
              onTap: () {
                Get.to(
                  OrderDetail(
                    orderObj: _orderCtrl.orders[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
