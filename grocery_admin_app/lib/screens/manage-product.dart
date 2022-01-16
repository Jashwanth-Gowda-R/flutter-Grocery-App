// ignore_for_file: file_names, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ManageProductScreen extends StatefulWidget {
  bool canEdit = false;
  var product = {};

  ManageProductScreen({this.canEdit, this.product});

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

  TextEditingController titleField = TextEditingController();
  TextEditingController priceField = TextEditingController();
  TextEditingController descriptionField = TextEditingController();

  FirebaseStorage _storage = FirebaseStorage.instance;
  var imageurl = 'http://placehold.it/120x120';

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

  addProduct() {
    _db.collection('products').add({
      'title': titleField.text,
      'price': double.parse(priceField.text),
      'categoryId': _selectedId,
      'description': descriptionField.text,
      "imgURL": imageurl,
    }).then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
  }

  updateProduct() {
    _db.collection('products').doc(widget.product['id']).update({
      "title": titleField.text,
      'price': double.parse(priceField.text),
      'categoryId': _selectedId,
      'description': descriptionField.text,
      "imgURL": imageurl,
    }).then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
    ;
  }

  deleteProduct() {
    _db.collection('products').doc(widget.product['id']).delete().then((value) {
      Get.back();
    }).catchError((e) {
      print(e);
    });
    ;
  }

  uploadProductImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile.path.length != null) {
      File image = File(pickedFile.path);
      var filepath = (DateTime.now().millisecondsSinceEpoch).toString();
      _storage
          .ref()
          .child('products')
          .child(filepath)
          .putFile(image)
          .then((res) {
        print(res);
        res.ref.getDownloadURL().then((url) {
          print('uploaded url' + url);
          setState(() {
            imageurl = url;
          });
        });
      }).catchError((e) => {print(e)});
    } else {
      print('no file picked!');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
    if (widget.canEdit) {
      titleField.text = widget.product['title'];
      priceField.text = widget.product['price'].toString();
      descriptionField.text = widget.product['description'];
      _selectedId = widget.product['categoryId'];
      imageurl = widget.product['imgURL'] != null
          ? widget.product['imgURL']
          : 'http://placehold.it/120x120';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("${widget.canEdit ? 'Edit' : "Add"} Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  uploadProductImage();
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageurl),
                  radius: 60,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: titleField,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Product Title",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: priceField,
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
                          _selectedId = v;
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
                controller: descriptionField,
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
                    "${widget.canEdit ? 'Update' : "Add"} Product",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    widget.canEdit ? updateProduct() : addProduct();
                    // addProduct();
                    // Get.back();
                  },
                ),
              ),
              widget.canEdit
                  ? TextButton(
                      onPressed: () {
                        deleteProduct();
                      },
                      child: Text("Delete",
                          style: TextStyle(
                            fontSize: 16,
                          )))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
