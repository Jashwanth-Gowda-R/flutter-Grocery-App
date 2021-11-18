// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            ListTile(
              title: Text('Delivery Address'),
              subtitle: Text('#4,1st main road,kalyannagar,bengaluru-72'),
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
                child: Text('Checkout(₹7900)',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              padding: EdgeInsets.all(4),
              height: 60,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
