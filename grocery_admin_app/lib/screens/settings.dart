// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/screens/profile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var profileImage = 'http://placehold.it/120x120';
  var title;
  var address;

  FirebaseFirestore _db = FirebaseFirestore.instance;

  readStoreDetails() {
    _db.collection('settings').doc('store').snapshots().listen((res) {
      print(res);
      print(res.id);
      print(res.data());
      setState(() {
        profileImage = res.data()['imageURl'];
        title = res.data()['name'];
        address = res.data()['address'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readStoreDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
              ),
              title: Text("${title != null ? title : 'Shani Shop'}"),
              subtitle: Text(
                  "${address != null ? address : 'Shakthi Garden,Bangalore'}"),
              trailing: TextButton(
                onPressed: () {
                  Get.to(ProfileScreen());
                },
                child: Text("Edit"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text("Notifications"),
              subtitle: Text("Manage Notifications"),
              trailing: Switch(
                onChanged: (i) {},
                value: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
