// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/screens/addresses.dart';
import 'package:grocery_user_app/screens/orders.dart';
import 'package:grocery_user_app/screens/profile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            title: Text('Jashwanth Gowda R'),
            subtitle: Text('9986621042'),
            trailing: TextButton(
              onPressed: () {
                Get.to(ProfileScreen());
              },
              child: Text('Edit'),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active_outlined,
              color: Colors.green,
            ),
            title: Text('Notifications'),
            subtitle: Text('Turn On/Off Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (i) {},
            ),
          ),
          ListTile(
              onTap: () {
                Get.to(MyOrders());
              },
              leading: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.green,
              ),
              title: Text('My Orders'),
              subtitle: Text('Manage My Orders'),
              trailing: Icon(Icons.arrow_forward)),
          ListTile(
              onTap: () {
                Get.to(AddressScreen());
              },
              leading: Icon(
                Icons.note_outlined,
                color: Colors.green,
              ),
              title: Text('My Addresses'),
              subtitle: Text('Manage Delivery Address'),
              trailing: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}
