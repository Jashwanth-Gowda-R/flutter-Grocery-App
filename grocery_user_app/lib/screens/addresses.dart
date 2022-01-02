// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/address.dart';
import 'package:grocery_user_app/screens/manage_address.dart';

class AddressScreen extends StatelessWidget {
  AddressController _addressCtrl = AddressController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addresses'),
      ),
      body: Obx(() => ListView.builder(
          itemCount: _addressCtrl.addresses.length,
          itemBuilder: (bc, index) {
            return ListTile(
                title: Text('${_addressCtrl.addresses[index]['tag']}'),
                subtitle: Text('${_addressCtrl.addresses[index]['address']}'),
                trailing: IconButton(
                  onPressed: () {
                    Get.to(ManageAddress(
                      canedit: true,
                      address: _addressCtrl.addresses[index],
                    ));
                  },
                  icon: Icon(Icons.edit_outlined),
                ));
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ManageAddress(
            canedit: false,
            address: {},
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
