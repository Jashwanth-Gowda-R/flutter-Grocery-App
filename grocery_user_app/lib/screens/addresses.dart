// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
