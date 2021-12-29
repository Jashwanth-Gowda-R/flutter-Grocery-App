// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCategoryScreen extends StatelessWidget {
  bool canEdit = false;
  var category = {};

  FirebaseFirestore _db = FirebaseFirestore.instance;
  TextEditingController categoryField = TextEditingController();

  ManageCategoryScreen({this.canEdit, this.category}) {
    categoryField.text = category['title'];
  }

  add() {
    _db
        .collection('categories')
        .add({'title': categoryField.text}).then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
  }

  update() {
    _db
        .collection('categories')
        .doc(category['id'])
        .update({"title": categoryField.text}).then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
    ;
  }

  delete() {
    _db.collection('categories').doc(category['id']).delete().then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${canEdit ? 'Edit' : 'Add'} Category"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: categoryField,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                labelText: "Category Name",
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
                  "${canEdit ? 'Update' : 'Add'}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  canEdit ? update() : add();
                },
              ),
            ),
            canEdit
                ? TextButton(
                    onPressed: () {
                      delete();
                    },
                    child: Text("Delete",
                        style: TextStyle(
                          fontSize: 16,
                        )))
                : Container(),
          ],
        ),
      ),
    );
  }
}
