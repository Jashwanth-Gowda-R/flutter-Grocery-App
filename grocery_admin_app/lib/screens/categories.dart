// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/screens/manage-category.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  FirebaseFirestore _db = FirebaseFirestore.instance;

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

  var _categories = [];

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
        title: Text("Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(ManageCategoryScreen());
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (bc, index) {
            return ListTile(
              title: Text("${_categories[index]['title']}"),
              trailing: Icon(Icons.edit_outlined),
              onTap: () {
                Get.to(ManageCategoryScreen());
              },
            );
          },
        ),
      ),
    );
  }
}
