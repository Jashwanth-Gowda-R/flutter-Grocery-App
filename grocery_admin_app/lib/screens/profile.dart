// ignore_for_file: prefer_const_constructors

// import 'dart:html';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_app/controllers/auth.dart';
import 'package:grocery_admin_app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  AuthController _auth = Get.put(AuthController());
  FirebaseAuth auths = FirebaseAuth.instance;

  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController emailField = TextEditingController();
  TextEditingController storeField = TextEditingController();
  TextEditingController mobileField = TextEditingController();
  TextEditingController addressField = TextEditingController();

  var profileImage = 'http://placehold.it/120x120';

  // logout() {
  //   _auth
  //       .signOut()
  //       .then(
  //         (value) => Get.offAll(LoginScreen()),
  //       )
  //       .catchError((e) {
  //     Get.showSnackbar(GetBar(
  //       message: e.toString(),
  //       duration: Duration(seconds: 5),
  //     ));
  //   });
  // }

  readStoreDetails() {
    _db.collection('settings').doc("store").snapshots().listen((res) {
      print(res);
      print(res.id);
      print(res.data());
      setState(() {
        storeField.text = res.data()['name'];
        mobileField.text = res.data()['mobile'];
        addressField.text = res.data()['address'];
        emailField.text = res.data()['email'];
        profileImage = res.data()['imageURl'];
      });
    });
  }

  // addAddress() {
  //   // obj['userId'] = auths.currentUser.uid;
  //   _db
  //       .collection('settings')
  //       .add({
  //         "address": addressField.text,
  //         "name": storeField.text,
  //         "mobile": mobileField.text,
  //         "email": emailField.text,
  //         "id": auths.currentUser.uid
  //       })
  //       .then((value) => Get.back())
  //       .catchError((e) {
  //         print(e);
  //       });
  // }

  updateStoreDetails() {
    _db.collection('settings').doc("store").update({
      "address": addressField.text,
      "name": storeField.text,
      "mobile": mobileField.text,
      "email": emailField.text,
    }).then((res) {
      Get.back();
      print("updated store details");
    }).catchError((e) {
      print(e);
    });
  }

  uploadProfileImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile.path.length != null) {
      File image = File(pickedFile.path);
      _storage
          .ref()
          .child('store')
          .child(auths.currentUser.uid)
          .putFile(image)
          .then((res) {
        print(res);
        res.ref.getDownloadURL().then((url) {
          print('uploadedm url' + url);
          _db.collection('settings').doc("store").update({
            "imageURl": url,
          }).then((res) {
            print("updated store image url details");
          }).catchError((e) {
            print(e);
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
    readStoreDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Edit Store"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  uploadProfileImage();
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                  radius: 60,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: storeField,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Name",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: emailField,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Email Address",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: mobileField,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Mobile Number",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                maxLines: 4,
                controller: addressField,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  labelText: "Store Address",
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
                    updateStoreDetails();
                    // Get.back();
                  },
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _auth.logout();
                  // Get.offAll(LoginScreen());
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
