// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/screens/manage_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addresses'),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('Home'),
              subtitle: Text('#4,1st main road,kalyannagar,bengaluru-72'),
              trailing: IconButton(
                onPressed: () {
                  Get.to(ManageAddress());
                },
                icon: Icon(Icons.edit_outlined),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ManageAddress());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
