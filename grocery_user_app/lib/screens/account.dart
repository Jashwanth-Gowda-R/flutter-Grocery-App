// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/screens/addresses.dart';
import 'package:grocery_user_app/screens/orders.dart';
import 'package:grocery_user_app/screens/profile.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var profileImage = 'http://placehold.it/120x120';
  var title;
  var phoneNumber;

  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  readUserDetails() {
    _db
        .collection('accounts')
        .doc(_auth.currentUser.uid)
        .snapshots()
        .listen((res) {
      print(res);
      print(res.id);
      print(res.data());
      setState(() {
        profileImage = res.data()['imageURL'];
        title = res.data()['name'];
        phoneNumber = res.data()['phoneNumber'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readUserDetails();
  }

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
              backgroundImage: NetworkImage(profileImage),
            ),
            title: Text('${title != null ? title : 'Shani'}'),
            subtitle:
                Text('${phoneNumber != null ? phoneNumber : '9876544321'}'),
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
            trailing: Icon(Icons.arrow_forward),
          ),
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
