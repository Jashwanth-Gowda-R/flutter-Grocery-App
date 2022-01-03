// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersDetails extends StatelessWidget {
  var orderDetailObj;

  OrdersDetails({this.orderDetailObj});

  toDateString(timestamp) {
    var date = DateTime.parse(timestamp.toDate().toString());
    var formatter = DateFormat("dd-MMM-yyyy hh:mm a");
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("#${orderDetailObj["id"]} - ${orderDetailObj["status"]}"),
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                title: Text('Order'),
                subtitle: Text('${toDateString(orderDetailObj["createdAt"])}'),
                trailing: Text('#${orderDetailObj["id"]}'),
              ),
              ListTile(
                title: Text('Status'),
                trailing: Text('${orderDetailObj["status"]}'),
              ),
              ListTile(
                title: Text('Delivery'),
                subtitle:
                    Text('${orderDetailObj["deliveryAddress"]["address"]}'),
                trailing: Text('${orderDetailObj["paymentMode"]}'),
              ),
              ListTile(
                title: Text('Your Mobile Number'),
                trailing:
                    Text('${orderDetailObj["deliveryAddress"]["mobile"]}'),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                padding: EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cart Items',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: orderDetailObj['cart'].length,
                      itemBuilder: (bc, index) {
                        return ListTile(
                          title:
                              Text('${orderDetailObj["cart"][index]['title']}'),
                          subtitle: Text(
                              '₹${orderDetailObj["cart"][index]['price']} x qty ${orderDetailObj["cart"][index]['qty']}'),
                          trailing: Text(
                              '₹${orderDetailObj["cart"][index]['total']}'),
                        );
                      })),
              Container(
                  color: Colors.green,
                  height: 80,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text('₹${orderDetailObj['cartTotal']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ))
            ],
          ),
        ));
  }
}
