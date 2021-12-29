// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProductScreen extends StatefulWidget {
  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  // List _categories = [
  //   "All",
  //   "Vegetables",
  //   "Meat",
  //   "Fruits",
  //   "Snacks",
  //   "Drinks",
  //   "Oils",
  //   "Daily Needs"
  // ];
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var _categories = [];
  var _selectedId = 'O1rnoIvwSe6mq4yrSZNk';

  fetchCategories() {
    _db.collection('categories').snapshots().listen((value) {
      var temp = [];
      value.docs.forEach((element) {
        temp.add({
          "id": element.id,
          "title": element.data()['title'],
        });
      });
      setState(() {
        _categories = temp;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 60,
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Product Title",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Price",
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Category'),
                    DropdownButton(
                      value: _selectedId,
                      onChanged: (v) {
                        setState(() {
                          _selectedId=v;
                        });
                      },
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          child: Text(category['title']),
                          value: category['id'],
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Description",
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.green,
                  ),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
